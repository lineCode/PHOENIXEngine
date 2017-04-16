-- sample.lua

-- 全局
g_s_t =
{
	Size_LeftBar = 50,
	Color_LeftBar = Float3:MakeColor(51, 51, 51),
	Size_LeftBarBut = 48,
}

g_s_UIFrame = nil
g_s_TableFrame = nil
g_s_MsgList = nil

-- 创建首页
function s_SampleCata()
	local ui = PX2_PROJ:GetUI()
	
	local frame = UIFrame:New()
	ui:AttachChild(frame)
	frame.LocalTransform:SetTranslateY(-1.0)
	frame:SetAnchorHor(0.0, 1.0)
	frame:SetAnchorVer(0.0, 1.0)
	
	local but = UIButton:New()
	frame:AttachChild(but)
	but:SetName("ButHome")
	but:SetAnchorHor(0.0, 0.0)
	but:SetAnchorVer(1.0, 1.0)
	but:SetSize(50, 50)
	but:SetAnchorParamHor(50, 50)
	but:SetAnchorParamVer(-50, -50)
	but:SetScriptHandler("s_Callback")
	
	local fPicBox = UIFPicBox:New()
	but:AttachChild(fPicBox)
	fPicBox.LocalTransform:SetTranslateY(-2.0)		
	fPicBox:GetUIPicBox():SetTexture("Data/General/images/icons/run.png")
	fPicBox:SetSize(30.0, 30.0)	
	
	g_s_UIFrame = UIFrame:New()
	frame:AttachChild(g_s_UIFrame)
	g_s_UIFrame:SetAnchorHor(0.0, 1.0)
	g_s_UIFrame:SetAnchorVer(0.0, 1.0)
	g_s_UIFrame:SetAnchorParamHor(25.0, -25.0)
	g_s_UIFrame:SetAnchorParamVer(25.0, -100.0)
	
	local msgFrameWidth = 150.0
	
	g_s_TableFrame = UITabFrame:New()
	g_s_UIFrame:AttachChild(g_s_TableFrame)
	g_s_TableFrame:SetAnchorParamHor(0.0, -msgFrameWidth)	
	g_s_TableFrame:CreateAddBackgroundPicBox(true, Float3:MakeColor(200, 200, 200))
	g_s_TableFrame:SetTabBarHeight(40)
	g_s_TableFrame:SetTabHeight(35)
	g_s_TableFrame:SetTabWidth(40)
	
	g_s_TableFrame:AddTab("About", PX2_LM_APP:GetValue("About"), s_CreateUIFrameAbout())
	g_s_TableFrame:AddTab("UIFrame", PX2_LM_APP:GetValue("UIFrame"), s_CreateUIFrame())
	g_s_TableFrame:AddTab("UIFPicBox", PX2_LM_APP:GetValue("UIFPicBox"), s_CreateUIFPicBox())
	g_s_TableFrame:AddTab("UIFText", PX2_LM_APP:GetValue("UIFText"), s_CreateUIFText())
	g_s_TableFrame:AddTab("UIButton", PX2_LM_APP:GetValue("UIButton"), s_CreateUIButton())
	g_s_TableFrame:AddTab("UICheckBox", PX2_LM_APP:GetValue("UICheckBox"), s_CreateUICheckBox())
	g_s_TableFrame:AddTab("UIComboBox", PX2_LM_APP:GetValue("UIComboBox"), s_CreateUIComboBox())
	g_s_TableFrame:AddTab("UIEditBox", PX2_LM_APP:GetValue("UIEditBox"), s_CreateUIEditBox())
	g_s_TableFrame:AddTab("UIProgress", PX2_LM_APP:GetValue("UIProgress"), s_CreateUIProgress())
	g_s_TableFrame:AddTab("UIColorSelect", PX2_LM_APP:GetValue("UIColorSelect"), s_CreateUIColorSelect())
	g_s_TableFrame:AddTab("UIList", PX2_LM_APP:GetValue("UIList"), s_CreateUIList())
	g_s_TableFrame:AddTab("UITree", PX2_LM_APP:GetValue("UITree"), s_CreateUITree())
	g_s_TableFrame:AddTab("UISplitter", PX2_LM_APP:GetValue("UISplitter"), s_CreateUISplitter())
	g_s_TableFrame:AddTab("UISlider", PX2_LM_APP:GetValue("UISlider"), s_CreateUISlider())
	g_s_TableFrame:AddTab("UIRound", PX2_LM_APP:GetValue("UIRound"), s_CreateUIRound())
	g_s_TableFrame:AddTab("UIWebFrame", PX2_LM_APP:GetValue("UIWebFrame"), s_CreateUIWebFrame())
	g_s_TableFrame:SetActiveTab("About")
	
	local rightFrame = UIFrame:New()
	g_s_UIFrame:AttachChild(rightFrame)
	rightFrame:CreateAddBackgroundPicBox(true)
	rightFrame:SetSize(msgFrameWidth, 0.0)
	rightFrame:SetPivot(0.0, 0.5)
	rightFrame:SetAnchorHor(1.0, 1.0)
	rightFrame:SetAnchorParamHor(-msgFrameWidth, 0.0)
	rightFrame:SetAnchorVer(0.0, 1.0)
	
	g_s_MsgList = UIList:New()
	rightFrame:AttachChild(g_s_MsgList)
	g_s_MsgList:SetAnchorHor(0.0, 1.0)
	g_s_MsgList:SetAnchorVer(0.0, 1.0)
	g_s_MsgList:AddItem("msglist")
	
end
-- PrintMsg
function s_PrintMsg(str)
	g_s_MsgList:AddItem(str)
end
-- 按钮回调
function s_Callback(objPtr, callType)
	local obj = Cast:ToO(objPtr)
	
	local name = obj:GetName()
	if UICT_PRESSED==callType then
		if "But0"==name then
			s_PrintMsg("UICT_PRESSED But0")
		elseif "But1"==name then
			s_PrintMsg("UICT_PRESSED But1")
		elseif "But2"==name then		
			s_PrintMsg("UICT_PRESSED But2")
		end
	elseif UICT_RELEASED==callType then
		if "ButHome" == name then
			g_s_UIFrame:Show(not g_s_UIFrame:IsShow())
		elseif "But0"==name then
			s_PrintMsg("UICT_RELEASED But0")
		elseif "But1"==name then
			s_PrintMsg("UICT_RELEASED But1")
		elseif "But2"==name then		
			s_PrintMsg("UICT_RELEASED But2")
		end
	elseif UICT_RELEASED_NOTPICK==callType then
		s_PrintMsg("UICT_RELEASED_NOTPICK")
	elseif UICT_CHECKED==callType then
		s_PrintMsg("UICT_CHECKED")
	elseif UICT_DISCHECKED==callType then
		s_PrintMsg("UICT_DISCHECKED")
	elseif UICT_EDITBOX_TEXTCHANGED==callType then
		s_PrintMsg("UICT_EDITBOX_TEXTCHANGED")
	elseif UICT_EDITBOX_ENTER==callType then
		s_PrintMsg("UICT_EDITBOX_ENTER")
	elseif UICT_LIST_SELECTED==callType then
		s_PrintMsg("UICT_LIST_SELECTED")
	elseif UICT_COMBOBOX_CHOOSED==callType then
		s_PrintMsg("UICT_COMBOBOX_CHOOSED")
	elseif UICT_TREE_SELECTED==callType then
		s_PrintMsg("UICT_TREE_SELECTED")
	elseif UICT_COLOR_SELECT==callType then
		s_PrintMsg("UICT_COLOR_SELECT")
	elseif UICT_ROUND_DRAG==callType then
		local dirSimple = obj:GetDragingDirSimple()
		s_PrintMsg("UICT_ROUND_DRAG"..dirSimple)
	elseif UICT_SLIDERCHANGED==callType then
		local perc = obj:GetPercent()
		s_PrintMsg("UICT_SLIDERCHANGED"..perc)
	end
end

-- About
function s_CreateUIFrameAbout()
	local frame = UIFrame:New()
	frame.LocalTransform:SetTranslateY(-1.0)
	frame:SetAnchorHor(0.0, 1.0)
	frame:SetAnchorVer(0.0, 1.0)
	
	local fText = UIFText:New()
	frame:AttachChild(fText)
	fText:SetAnchorHor(0.0, 1.0)
	fText:SetAnchorVer(0.0, 1.0)
	fText:GetText():SetText("欢迎使用#RPhoenixIoT#K进行开发! :-D ");
	
	return frame
end

-- UIFrame
function s_CreateUIFrame()
	local frame = UIFrame:New()
	frame.LocalTransform:SetTranslateY(-1.0)
	frame:SetAnchorHor(0.0, 1.0)
	frame:SetAnchorVer(0.0, 1.0)	
	
	local frame0 = UIFrame:New()
	frame:AttachChild(frame0)
	frame0:CreateAddBackgroundPicBox(true, Float3.RED)
	frame0:SetAnchorHor(0.0, 1.0)
	frame0:SetAnchorVer(1.0, 1.0)
	frame0:SetSize(0.0, 100.0)
	frame0:SetAnchorParamHor(50.0, -50.0)
	frame0:SetAnchorParamVer(-50.0, -5.0)
	
	local frame1 = UIFrame:New()
	frame:AttachChild(frame1)
	frame1:CreateAddBackgroundPicBox(true, Float3.GREEN)
	frame1:SetPivot(0.5, 1.0)
	frame1:SetAnchorHor(0.0, 1.0)
	frame1:SetAnchorVer(1.0, 1.0)
	frame1:SetSize(0.0, 100.0)
	frame1:SetAnchorParamHor(50.0, -50.0)
	frame1:SetAnchorParamVer(-100.0, -100.0)
	
	local frame2 = UIFrame:New()
	frame:AttachChild(frame2)
	frame2:CreateAddBackgroundPicBox(false, Float3.WHITE)
	frame2:SetPivot(0.5, 1.0)
	frame2:SetAnchorHor(0.0, 0.0)
	frame2:SetAnchorVer(1.0, 1.0)
	frame2:SetSize(200.0, 200.0)
	frame2:SetAnchorParamHor(150.0, 0.0)
	frame2:SetAnchorParamVer(-200.0, 0.0)
	
	return frame
end

-- UIFPicBox
function s_CreateUIFPicBox()
	local frame = UIFrame:New()
	frame.LocalTransform:SetTranslateY(-1.0)
	frame:SetAnchorHor(0.0, 1.0)
	frame:SetAnchorVer(0.0, 1.0)
	
	local size = 120
	
	local gridAlignCtrl = frame:CreateAddGridAlignCtrl()
	gridAlignCtrl:SetChildAlignment(UIFrameGridAlignControl.CAT_MIDDLE_CENTER)
	gridAlignCtrl:SetConstraintType(UIFrameGridAlignControl.CT_FIXED_COLUMN_COUNT)
	gridAlignCtrl:SetConstraintValue(4)
	gridAlignCtrl:SetBorder(10.0, 10.0, 10.0, 10.0);
	gridAlignCtrl:SetCellSize(Sizef(size, size))
	
	local fPicBox = UIFPicBox:New()
	frame:AttachChild(fPicBox)
	fPicBox:SetSize(size, size)
	fPicBox:GetUIPicBox():SetTexture("Data/General/images/pics/arduino.png")
	fPicBox:RegistToScriptSystem()
	
	local fPicBox1 = UIFPicBox:New()
	frame:AttachChild(fPicBox1)
	fPicBox1:SetSize(size, size)
	fPicBox1:GetUIPicBox():SetUVRepeat(3, 3)
	fPicBox1:GetUIPicBox():SetTexture("Data/General/images/pics/raspberry.png")
	fPicBox1:RegistToScriptSystem()
	
	local fPicBox2 = UIFPicBox:New()
	frame:AttachChild(fPicBox2)
	fPicBox2:SetSize(size, size)
	fPicBox2:GetUIPicBox():SetPicBoxType(UIPicBox.PBT_NINE)
	fPicBox2:GetUIPicBox():SetTexCornerSize(8, 8, 8, 8)
	fPicBox2:GetUIPicBox():SetTexture("Data/General/images/pics/but.png")
	fPicBox2:RegistToScriptSystem()
	
	local fPicBox3 = UIFPicBox:New()
	frame:AttachChild(fPicBox3)
	fPicBox3:SetSize(size, size)
	fPicBox3:GetUIPicBox():SetPicBoxType(UIPicBox.PBT_NINE)
	fPicBox3:GetUIPicBox():SetTexCornerSize(8, 8, 8, 8)
	fPicBox3:GetUIPicBox():SetTexture("Data/engine/common.xml", "but_normal")
	fPicBox3:RegistToScriptSystem()
	
	return frame
end

-- UIFText
function s_CreateUIFText()
	local frame = UIFrame:New()
	frame.LocalTransform:SetTranslateY(-1.0)
	frame:SetAnchorHor(0.0, 1.0)
	frame:SetAnchorVer(0.0, 1.0)
	
	local size = 200
	
	local gridAlignCtrl = frame:CreateAddGridAlignCtrl()
	gridAlignCtrl:SetChildAlignment(UIFrameGridAlignControl.CAT_MIDDLE_CENTER)
	gridAlignCtrl:SetConstraintType(UIFrameGridAlignControl.CT_FIXED_COLUMN_COUNT)
	gridAlignCtrl:SetConstraintValue(3)
	gridAlignCtrl:SetBorder(10.0, 10.0, 10.0, 10.0);
	gridAlignCtrl:SetCellSize(Sizef(size, size))
	
	local fText = UIFText:New()
	frame:AttachChild(fText)
	fText:SetSize(size, size)
	fText:GetText():SetFontColor(Float3:MakeColor(55, 0, 0))
	fText:GetText():SetFontScale(1.5)
	fText:RegistToScriptSystem()
	
	local fText1 = UIFText:New()
	frame:AttachChild(fText1)
	fText1:SetSize(size, size)
	fText1:CreateAddBackgroundPicBox(true)
	fText1:GetText():SetFont("Data/General/fonts/hyswlongfangsong.ttf", 24, 24, FES_UNDERLINE)
	fText1:GetText():SetText("人工智能")
	fText1:GetText():SetBorderShadowColor(Float3(100, 0.0, 0.0))
	fText1:GetText():SetDrawStyle(FD_SHADOW)
	fText1:GetText():SetAligns(TEXTALIGN_LEFT+TEXTALIGN_TOP)
	fText1:RegistToScriptSystem()
	
	local fText2 = UIFText:New()
	frame:AttachChild(fText2)
	fText2:SetSize(size, size)
	fText2:CreateAddBackgroundPicBox(true)
	fText2:GetText():SetText("智能娱乐智能娱乐智能娱乐智能娱乐智能娱乐智能娱乐智能娱乐")
	fText2:GetText():SetRectUseage(UIText.RU_CLIPWARP)
	fText2:GetText():SetAutoWarp(true)
	fText2:RegistToScriptSystem()
	
	return frame
end

-- UIButton
function s_CreateUIButton()
	local frame = UIFrame:New()
	frame.LocalTransform:SetTranslateY(-1.0)
	frame:SetAnchorHor(0.0, 1.0)
	frame:SetAnchorVer(0.0, 1.0)
	
	local size = 200
	
	local gridAlignCtrl = frame:CreateAddGridAlignCtrl()
	gridAlignCtrl:SetChildAlignment(UIFrameGridAlignControl.CAT_MIDDLE_CENTER)
	gridAlignCtrl:SetConstraintType(UIFrameGridAlignControl.CT_FIXED_COLUMN_COUNT)
	gridAlignCtrl:SetConstraintValue(3)
	gridAlignCtrl:SetBorder(10.0, 10.0, 10.0, 10.0);
	gridAlignCtrl:SetCellSize(Sizef(size, size))
	
	local but = UIButton:New()
	frame:AttachChild(but)
	but:SetName("But0")
	but:SetSize(size, size)
	but:CreateAddText("按钮0")
	but:SetScriptHandler("s_Callback")
	but:RegistToScriptSystem()
	
	local but1 = UIButton:New()
	frame:AttachChild(but1)
	but1:SetName("But1")
	but1:SetButType(UIButtonBase.BT_PICBOXSWAP)	
	but1:GetPicBoxAtState(UIButtonBase.BS_NORMAL):SetPicBoxType(UIPicBox.PBT_NINE)
	but1:GetPicBoxAtState(UIButtonBase.BS_NORMAL):SetTexCornerSize(8, 8, 8, 8)
	but1:GetPicBoxAtState(UIButtonBase.BS_NORMAL):SetTexture("Data/engine/common.xml", "but_normal")	
	but1:GetPicBoxAtState(UIButtonBase.BS_HOVERED):SetPicBoxType(UIPicBox.PBT_NINE)
	but1:GetPicBoxAtState(UIButtonBase.BS_HOVERED):SetTexCornerSize(8, 8, 8, 8)
	but1:GetPicBoxAtState(UIButtonBase.BS_HOVERED):SetTexture("Data/engine/common.xml", "but_over")	
	but1:GetPicBoxAtState(UIButtonBase.BS_PRESSED):SetPicBoxType(UIPicBox.PBT_NINE)
	but1:GetPicBoxAtState(UIButtonBase.BS_PRESSED):SetTexCornerSize(8, 8, 8, 8)
	but1:GetPicBoxAtState(UIButtonBase.BS_PRESSED):SetTexture("Data/engine/common.xml", "but_down")	
	but1:SetSize(size, size)
	but1:CreateAddText("按钮1")
	but1:SetScriptHandler("s_Callback")
	but1:RegistToScriptSystem()
	
	local but2 = UIButton:New()
	frame:AttachChild(but2)
	but2:SetName("But2")
	but2:SetSize(size, size)
	but2:CreateAddText("按钮3")
	but2:SetScriptHandler("s_Callback")
	but2:RegistToScriptSystem()
	
	return frame
end

-- UICheckBox
function s_CreateUICheckBox()
	local frame = UIFrame:New()
	frame.LocalTransform:SetTranslateY(-1.0)
	frame:SetAnchorHor(0.0, 1.0)
	frame:SetAnchorVer(0.0, 1.0)	
	
	local checkButton = UICheckButton:New()
	frame:AttachChild(checkButton)
	checkButton:SetName("CheckButton")
	checkButton:SetSize(40.0, 40.0)
	checkButton:SetScriptHandler("s_Callback")
	checkButton:RegistToScriptSystem()
	
	return frame
end

-- UIComboBox
function s_CreateUIComboBox()
	local frame = UIFrame:New()
	frame.LocalTransform:SetTranslateY(-1.0)
	frame:SetAnchorHor(0.0, 1.0)
	frame:SetAnchorVer(0.0, 1.0)
	
	local comboBox = UIComboBox:New()
	frame:AttachChild(comboBox)
	comboBox:AddChooseStr("Choose0")
	comboBox:AddChooseStr("Choose1")
	comboBox:ChooseStr("Choose0")
	comboBox:SetScriptHandler("s_Callback")
	comboBox:RegistToScriptSystem()
	
	return frame
end

-- UIEditBox
function s_CreateUIEditBox()
	local frame = UIFrame:New()
	frame.LocalTransform:SetTranslateY(-1.0)
	frame:SetAnchorHor(0.0, 1.0)
	frame:SetAnchorVer(0.0, 1.0)	
	
	local editbox = UIEditBox:New()
	frame:AttachChild(editbox)
	editbox:SetScriptHandler("s_Callback")
	editbox:RegistToScriptSystem()
	
	return frame
end

-- UIProgress
function s_CreateUIProgress()
	local frame = UIFrame:New()
	frame.LocalTransform:SetTranslateY(-1.0)
	frame:SetAnchorHor(0.0, 1.0)
	frame:SetAnchorVer(0.0, 1.0)	
	
	local progressBar = UIProgressBar:New()
	frame:AttachChild(progressBar)
	progressBar:SetProgress(0.5)
	progressBar:SetScriptHandler("s_Callback")
	progressBar:RegistToScriptSystem()
	
	return frame
end

-- UIColorSelect
function s_CreateUIColorSelect()
	local frame = UIFrame:New()
	frame.LocalTransform:SetTranslateY(-1.0)
	frame:SetAnchorHor(0.0, 1.0)
	frame:SetAnchorVer(0.0, 1.0)	
	
	local colorSelect = UIColorSelector:New()
	frame:AttachChild(colorSelect)
	colorSelect:SetScriptHandler("s_Callback")
	colorSelect:SetSize(300, 300)
	colorSelect:SetAnchorHor(0.5, 0.5)
	colorSelect:SetAnchorVer(0.5, 0.5)
	colorSelect:RegistToScriptSystem()
	
	return frame
end

-- UIList
function s_CreateUIList()
	local frame = UIFrame:New()
	frame.LocalTransform:SetTranslateY(-1.0)
	frame:SetAnchorHor(0.0, 1.0)
	frame:SetAnchorVer(0.0, 1.0)	
	
	local list = UIList:New()
	frame:AttachChild(list)
	list:SetScriptHandler("s_Callback")
	list:AddItem("a")
	list:AddItem("b")
	list:AddItem("c")
	list:AddItem("d")
	list:RegistToScriptSystem()
	
	return frame
end

-- UITree
function s_CreateUITree()
	local frame = UIFrame:New()
	frame.LocalTransform:SetTranslateY(-1.0)
	frame:SetAnchorHor(0.0, 1.0)
	frame:SetAnchorVer(0.0, 1.0)	
	
	local tree = UITree:New()
	frame:AttachChild(tree)
	tree:SetScriptHandler("s_Callback")
	local itemA = tree:AddItem(tree:GetRootItem(), "a", "a")
		tree:AddItem(itemA, "aa", "aa")
	local itemB = tree:AddItem(tree:GetRootItem(), "b", "b")
		tree:AddItem(itemB, "bb", "bb")
	local itemC = tree:AddItem(tree:GetRootItem(), "c", "c")
		tree:AddItem(itemC, "cc", "cc")
	tree:SetSize(200, 200)
	tree:RegistToScriptSystem()
	
	return frame
end

-- UISplitter
function s_CreateUISplitter()
	local frame = UIFrame:New()
	frame.LocalTransform:SetTranslateY(-1.0)
	frame:SetAnchorHor(0.0, 1.0)
	frame:SetAnchorVer(0.0, 1.0)
	
	local splitter = UISplitterFrame:New()
	frame:AttachChild(splitter)
	splitter.LocalTransform:SetTranslateY(-1.0)
	splitter:SetScriptHandler("s_Callback")
	splitter:SetSize(0.0, 4.0)
	splitter:SetAnchorHor(0.0, 1.0)
	splitter:SetAnchorParamHor(0.0, 0.0)
	splitter:SetAnchorVer(0.0, 0.0)
	splitter:SetAnchorParamVer(400.0, 400.0)
	splitter:RegistToScriptSystem()
	
	return frame
end

-- UISlider
function s_CreateUISlider()
	local frame = UIFrame:New()
	frame.LocalTransform:SetTranslateY(-1.0)
	frame:SetAnchorHor(0.0, 1.0)
	frame:SetAnchorVer(0.0, 1.0)	
	
	local slider = UISlider:New()
	frame:AttachChild(slider)
	slider:SetName("Slider")
	slider.LocalTransform:SetTranslateY(-1.0)
	slider:SetScriptHandler("s_Callback")
	slider:RegistToScriptSystem()
	slider:CreateAddBackgroundPicBox()
	
	return frame
end

-- UIRound
function s_CreateUIRound()
	local frame = UIFrame:New()
	frame.LocalTransform:SetTranslateY(-1.0)
	frame:SetAnchorHor(0.0, 1.0)
	frame:SetAnchorVer(0.0, 1.0)

	local round = UIRound:New()
	frame:AttachChild(round)
	round.LocalTransform:SetTranslateY(-1.0)
	round:SetScriptHandler("s_Callback")
	round:RegistToScriptSystem()
	
	return frame
end

-- UIWebFrame
function s_CreateUIWebFrame()
	local frame = UIFrame:New()
	frame.LocalTransform:SetTranslateY(-1.0)
	frame:SetAnchorHor(0.0, 1.0)
	frame:SetAnchorVer(0.0, 1.0)
	
	local webFrame = UIWebFrame:New()
	frame:AttachChild(webFrame)
	webFrame:SetAnchorHor(0.0, 1.0)
	webFrame:SetAnchorVer(0.0, 1.0)
	webFrame:SetUpdateToTex(true)
	webFrame:LoadURL("https://github.com/PhoenixIoT")
	
	return frame
end