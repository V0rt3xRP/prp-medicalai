QBCore = exports['qb-core']:GetCoreObject()

local onJob, onCoolDown, pedSapawned = false, false, false

function jobCallDown()
    onCoolDown = true
    Wait(Config.jobCoolDown * 60000) -- Use 60000 to set in minutes in Config
    onCoolDown = false
    onJob = false
    TriggerEvent('prp-medicalai:client:startmission')
end

function randomiseLocation()
    local random = math.random(1,10)

    pedLocation = Config.downedPedLocation[random]

    Wait(500)
    exports['ps-dispatch']:LocalInjuriedPerson(pedLocation)
    SetNewWaypoint(pedLocation)
    spawnDownedLocal()
end

RegisterNetEvent('prp-medicalai:client:startmission', function()
    if onCoolDown == false then
        if onJob == false then
            onJob = true
            Wait(500)
            randomiseLocation()
        else
            QBCore.Functions.Notify('Job Cancelled', 'error', 7500)
            onJob, onCoolDown, pedSapawned = false, false, false
            SetWaypointOff()
            DeletePed(downedPed)
        end
    else
        QBCore.Functions.Notify('Job On Cool Down!', 'error', 7500)
    end
end)

function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Wait(5)
    end
end

function spawnDownedLocal()
    local i = math.random(1, #Config.PedPool)
    RequestModel(Config.PedPool[i]) while
    not HasModelLoaded(Config.PedPool[i]) do
        Wait(0)
    end
    downedPed = CreatePed(0, Config.PedPool[i], pedLocation.x, pedLocation.y, pedLocation.z, false, false)
    pedSapawned = true
    exports['qb-target']:AddTargetEntity(downedPed, {
        options = {
            {
                type = "client",
                event = "prp-medicalai:client:revivePed",
                label = 'Give Medical Attection',
                icon = 'fas fa-syringe',
                canInteract = function()
                    if pedSapawned == true then return true end
                    return false
                end
            }
        },
        distance = 2.0
    })
    while pedSapawned == true do
        Wait(0)
        loadAnimDict('missarmenian2')
        TaskPlayAnim(downedPed, "missarmenian2", "corpse_search_exit_ped",  8.0, 8.0, -1, 1, 0, 0, 0, 0)
    end
end

RegisterNetEvent('prp-medicalai:client:revivePed', function()
    hasitem = QBCore.Functions.HasItem(Config.bandageItem)
    if hasitem == true then
        ExecuteCommand('e cpr')
        QBCore.Functions.Progressbar('ped_revive', 'Reviving Local...', 5000, false, true, { -- Name | Label | Time | useWhileDead | canCancel
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Play When Done
            ExecuteCommand('e c')
            pedSapawned = false
            Wait(500)
            TriggerServerEvent("QBCore:Server:RemoveItem", Config.bandageItem, 1)
            TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items[Config.bandageItem], "remove")
            ClearPedTasksImmediately(downedPed)
            SetPedMovementClipset(downedPed, "move_m@injured", 1 )
            TaskGoStraightToCoord(downedPed, 0,0,0,5,10000,0)
            QBCore.Functions.TriggerCallback('prp-medicalai:server:giveCash', function(check) -- Trigger callback for pay (More Secure)
                if check then
                    jobCallDown()
                end
            end)
        end, function() -- Play When Cancel
            ExecuteCommand('e c')
        end)
    else
        QBCore.Functions.Notify('You have no bandages on you!', 'error', 7500)
    end
end)
