//
//  Scheduler.swift
//  PictarineTest
//
//  Created by Benjamin Duhieu on 17/01/2024.
//

import Foundation
import Combine

// MARK: - Scheduler

/// Class responsible for managing schedulers.
final class Scheduler {

    // MARK: - Properties

    /// Scheduler for background work.
    static var backgroundWorkScheduler: OperationQueue = {
        let operationQueue = OperationQueue()
        operationQueue.maxConcurrentOperationCount = 5
        operationQueue.qualityOfService = QualityOfService.userInitiated
        return operationQueue
    }()

    /// Scheduler for the main thread.
    static let mainScheduler = RunLoop.main
}
