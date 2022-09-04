QBCore = exports['qb-core']:GetCoreObject()

-- Callback for Money
QBCore.Functions.CreateCallback('prp-medicalai:server:giveCash', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(source)
    local paycheck = math.random(Config.payMin, Config.payMax)

    if Config.Paycash == true then
        if Player.Functions.AddMoney("cash", paycheck) then
            TriggerClientEvent('QBCore:Notify', src, 'You received $' ..paycheck.. ' for helping. Wait for your next call!', 'success', 7500)
            cb(true)
        else
            cb(false)
        end
    else
        if Player.Functions.AddMoney("bank", paycheck) then
            TriggerClientEvent('QBCore:Notify', src, 'You received $' ..paycheck.. ' for helping. Wait for your next call!', 'success', 7500)
            cb(true)
        else
            cb(false)
        end
    end

end)
