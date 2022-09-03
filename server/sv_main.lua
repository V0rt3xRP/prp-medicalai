QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('prp-medicalai:server:giveCash', function(paycheck)
    local src = source
    local ply = QBCore.Functions.GetPlayer(src)
    if Config.Paycash == true then
        ply.Functions.AddMoney("cash", paycheck)
    else
        ply.Functions.AddMoney("bank", paycheck)
    end
end)