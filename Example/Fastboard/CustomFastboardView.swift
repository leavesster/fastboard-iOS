//
//  CustomFastboardView.swift
//  Fastboard_Example
//
//  Created by xuyunshi on 2022/1/7.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import UIKit
import Whiteboard
import Fastboard
import SnapKit

class CustomFastboardOverlay: FastRoomOverlay {
    func updateRoomPhaseUpdate(_ phase: FastRoomPhase) {
        return
    }
    
    func dismissAllSubPanels() {
        return
    }
    
    func invalidAllLayout() {
        return
    }
    
    func updateBoxState(_ state: WhiteWindowBoxState?) {
        return
    }
    
    func updateControlBarLayout(direction: OperationBarDirection) {
        return
    }
    
    func updateUIWithInitAppliance(_ appliance: WhiteApplianceNameKey?, shape: WhiteApplianceShapeTypeKey?) {
        if let appliance = appliance {
            operationsPanel.updateWithApplianceOutside(appliance, shape: shape)
        }
    }
    
    func updateStrokeColor(_ color: UIColor) {
        return
    }
    
    func updateStrokeWidth(_ width: Float) {
        return
    }
    
    func updatePageState(_ state: WhitePageState) {
        return
    }
    
    func updateUndoEnable(_ enable: Bool) {
        return
    }
    
    func updateRedoEnable(_ enable: Bool) {
        return
    }
    
    func itemWillBeExecution(fastPanel: FastRoomPanel, item: FastRoomOperationItem) {
        return
    }
    
    func setAllPanel(hide: Bool) {
        totalPanels.forEach { $0.view?.isHidden = hide }
    }
    
    func setPanelItemHide(item: FastRoomDefaultOperationIdentifier, hide: Bool) {
        totalPanels.forEach { $0.setItemHide(fromKey: item, hide: hide)}
    }
    
    func setupWith(room: WhiteRoom, fastboardView: FastRoomView, direction: OperationBarDirection) {
        let operationView = operationsPanel.setup(room: room, direction: .horizontal, mask: [.layerMinXMinYCorner, .layerMaxXMinYCorner])
        fastboardView.addSubview(operationView)
        operationView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(fastboardView.whiteboardView)
        }
    }
    
    var totalPanels: [FastRoomPanel] {
        [operationsPanel]
    }
    
    lazy var operationsPanel = createOperationPanel()
}

extension CustomFastboardOverlay {
    func createOperationPanel() -> FastRoomPanel {
        var items: [FastRoomOperationItem] = []
        items.append(FastRoomDefaultOperationItem.selectableApplianceItem(.AppliancePencil, shape: nil))
        items.append(FastRoomDefaultOperationItem.selectableApplianceItem(.ApplianceEraser, shape: nil))
        let panel = FastRoomPanel(items: items)
        return panel
    }
}
