--██╗░░░░░░█████╗░███╗░░██╗░█████╗░███████╗██╗░░░░░░█████╗░████████╗  ██████╗░███████╗██╗░░░██╗
--██║░░░░░██╔══██╗████╗░██║██╔══██╗██╔════╝██║░░░░░██╔══██╗╚══██╔══╝  ██╔══██╗██╔════╝██║░░░██║
--██║░░░░░███████║██╔██╗██║██║░░╚═╝█████╗░░██║░░░░░██║░░██║░░░██║░░░  ██║░░██║█████╗░░╚██╗░██╔╝
--██║░░░░░██╔══██║██║╚████║██║░░██╗██╔══╝░░██║░░░░░██║░░██║░░░██║░░░  ██║░░██║██╔══╝░░░╚████╔╝░
--███████╗██║░░██║██║░╚███║╚█████╔╝███████╗███████╗╚█████╔╝░░░██║░░░  ██████╔╝███████╗░░╚██╔╝░░
--╚══════╝╚═╝░░╚═╝╚═╝░░╚══╝░╚════╝░╚══════╝╚══════╝░╚════╝░░░░╚═╝░░░  ╚═════╝░╚══════╝░░░╚═╝░░░

Config = {}

Key = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

Config["Key"] 				= 38 -- ปุ่มกด ค่าเดิม E
Config["Item"]				= "randomschool" -- ไอเท็มย้ายโรงเรียน
Config["UseItem"]           = true -- ให้กดใช้ไอเท็มย้ายโรงเรียนได้เลยมั้ย -- false = ต้องไปหา npc เท่านั้น
Config["Progbar_Time"]		= 3000 -- เวลาหลอดโหลดเวลาเลือกโรงเรียน หรือ สุ่ม
Config["Distance"]			= 2 -- ระยะของการกด E
Config["Notification"]		= "กด <span class = 'INPUT_CONTEXT'>E</span> คุยกับอาจารย์" -- ข้อความตอนเดินเข้าไปใกล้ๆ
Config["RemoveItem"] 		= {} -- ไอเท็มที่ให้ลบเวลาสุ่มโรงเรียนหรือเลือก



Config.School = {
    [1] = {
		  Enabled     = true, -- ปิดรับโรงเรียน
          Job         = 'gang', -- ชื่อ Job
		  JobName     = 'Gang', -- ชื่อ Job
		  ItemName    = 'rd_painkiller', -- ของที่แจก
		  ItemCount   = 1, -- จำนวนของที่แจก
		  Teleport    = { -- ระบบย้ายไปโรงเรียน
		    Enabled   = true, -- ระบบย้ายไปโรงเรียน เปิดปิด
			coords    = vector3(-1722.08, 161.12, 65.28),-- พิกัด
		  },
		  Percent     = 25, -- โอกาศสุ่ม
		  ChatMain		    = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(255 , 0, 0); border-radius: 3px;"></i>ประกาศจาก : ครูเพ็ญศรี <br>{0}   {1}</br></div>', -- แชทสี
	},
	[2] = {
		  Enabled     = true, -- ปิดรับโรงเรียน
          Job   	  = 'mafia', -- ชื่อ Job
		  JobName     = 'Mafia', -- ชื่อ Job
		  ItemName 	  = 'rd_painkiller', -- ของที่แจก
		  ItemCount   = 1, -- จำนวนของที่แจก
		  Teleport    = { -- ระบบย้ายไปโรงเรียน
		    Enabled   = true, -- ระบบย้ายไปโรงเรียน เปิดปิด
			coords    = vector3(893.36, -46.08, 79.92),-- พิกัด
		  },
		  Percent 	  = 25, -- โอกาศสุ่ม
		  ChatMain    = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(	0, 0, 255); border-radius: 3px;"></i>ประกาศจาก : ครูเพ็ญศรี <br>{0}   {1}</br></div>',
	},
	[3] = {
		  Enabled     = true, -- ปิดรับโรงเรียน
          Job         = 'soldier', -- ชื่อ Job
		  JobName     = 'Soldier', -- ชื่อ Job
		  ItemName    = 'rd_painkiller', -- ของที่แจก
		  ItemCount   = 1, -- จำนวนของที่แจก
		  Teleport    = { -- ระบบย้ายไปโรงเรียน
		    Enabled   = true, -- ระบบย้ายไปโรงเรียน เปิดปิด
			coords    = vector3(-1147.92, -1724.92, 5.52),-- พิกัด
		  },
		  Percent     = 25, -- โอกาศสุ่ม
		  ChatMain	  = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(0, 0, 255); border-radius: 3px;"></i>ประกาศจาก : ครูเพ็ญศรี <br>{0}   {1}</br></div>',
	},
	[4] = {
		  Enabled     = true, -- ปิดรับโรงเรียน
          Job         = 'terrorist', -- ชื่อ Job
		  JobName     = 'Terrorist', -- ชื่อ Job
		  ItemName    = 'rd_painkiller', 
		  ItemCount   = 1,
		  Teleport    = { -- ระบบย้ายไปโรงเรียน
		    Enabled   = true, -- ระบบย้ายไปโรงเรียน เปิดปิด
			coords    = vector3(996.48, -2342.68, 39.16),-- พิกัด
		  },
		  Percent     = 25,-- โอกาศสุ่ม
		  ChatMain    = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(231, 3, 3); border-radius: 3px;"></i>ประกาศจาก : ครูเพ็ญศรี<br>{0}   {1}</br></div>', -- แชทสี
	},
}


Config.Position = {
    [1] = {
        npc = vector3(230.445, -780.457, 30.7072),
        h = 157.04,
        model = 'g_m_y_mexgoon_01',
        blips = {open = false, Id = 84, Size = 0.7, Color = 4, Text = "L4N HIGH SCHOOL"}
    },
	--[[
	[2] = {
        npc = vector3(-259.913, -975.405, 31.219),
        h = 214.68,
        model = 'g_m_y_mexgoon_01',
        blips = {open = true, Id = 84, Size = 0.7, Color = 4, Text = "L4N HIGH SCHOOL"}
    },
	--]]
}


Config["NotifyError"] = "โรงเรียนนี้ปิดรับนักเรียน"
pNotify = function(at, au, av, aw)
	exports.pNotify:SendNotification({
		text = tostring(at) or '',
		type = au or 'info',
		timeout = av or 1500,
		layout = aw or "bottomCenter",
		queue = 'pNotify'
	})
end