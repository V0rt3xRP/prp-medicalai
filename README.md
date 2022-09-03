# ProjectRP EMS AI Missions
Toggleable AI calls for EMS!

Video
>https://streamable.com/p7c8xi

Uses:
>qb-radialmenu,

>qb-target

About:
>Toggleable AI calls for the bored onduty medical staff!

future plans:
> Add a leveling system,

> different types of calls,

> Fire calls,

> Joint AI calls (EMS, Police, Fire),

#ps-dispatch configuration

cl_events.lua;
```
local function LocalInjuriedPerson(pedLocation)
    local locationInfo = getStreetandZone(pedLocation)
    local gender = GetPedGender()
    TriggerServerEvent("dispatch:server:notify", {
        dispatchcodename = "localcivdown", -- has to match the codes in sv_dispatchcodes.lua so that it generates the right blip
        dispatchCode = "10-70",
        firstStreet = locationInfo,
        gender = gender,
        model = nil,
        plate = nil,
        priority = 2, -- priority
        firstColor = nil,
        automaticGunfire = false,
        origin = {
            x = pedLocation.x,
            y = pedLocation.y,
            z = pedLocation.z
        },
        dispatchMessage = _U('persondown'), -- message
        job = { "ambulance" } -- jobs that will get the alerts
    })
end
exports('LocalInjuriedPerson', LocalInjuriedPerson)
```

sv_dispatchcodes;
```
    ["localcivdown"] =  {displayCode = '10-70', description = "Local Civilan Down", radius = 0, recipientList = {'ambulance'}, blipSprite = 126, blipColour = 3, blipScale = 1.5, blipLength = 2, sound = "dispatch", offset = "false", blipflash = "false"},
```

>qb-radialmenu add event > 'prp-medicalai:client:startmission'

