Config = Config or {}

Config.emsJob = 'ambulance'
Config.bandageItem = 'bandage'
Config.jobCoolDown = math.random(3, 10) -- Set in minutes
Config.payMin = 500
Config.payMax = 1000
Config.Paycash = true -- true = cash / false = bank 

Config.downedPedLocation = {
    [1] = vector4(2013.97, 3782.31, 32.18, 287.11),
    [2] = vector4(1716.1, 3322.31, 41.22, 207.51),
    [3] = vector4(2008.67, 3048.98, 47.21, 124.98),
    [4] = vector4(1851.25, 2585.84, 45.67, 90.89),
    [5] = vector4(1234.43, 330.03, 81.99, 222.82),
    [6] = vector4(-27.2, -193.39, 52.36, 105.79),
    [7] = vector4(321.1, -1003.65, 29.3, 94.53),
    [8] = vector4(893.53, -892.33, 27.06, 256.97),
    [9] = vector4(941.13, -2167.45, 30.54, 336.23),
    [10] = vector4(-234.91, -2655.18, 6.0, 141.78),
}

Config.PedPool = {
	[1] = `a_f_m_beach_01`,
	[2] = `a_f_m_bevhills_01`,
	[3] = `a_f_m_bevhills_02`,
	[4] = `a_f_m_bodybuild_01`,
	[5] = `a_f_m_business_02`,
	[6] = `a_f_m_downtown_01`,
	[7] = `a_m_m_afriamer_01`,
	[8] = `a_m_m_beach_01`,
	[9] = `a_m_m_beach_02`,
	[10] = `a_m_m_bevhills_01`,
	[11] = `g_m_importexport_01`,
	[12] = `g_m_m_mexboss_01`,
	[13] = `g_m_y_salvagoon_02`,
	[14] = `mp_f_cardesign_01`,
}
