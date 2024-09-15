import Foundation

// Order of events are in order of the API documentation
// https://docs.github.com/en/rest/using-the-rest-api/issue-event-types

public enum TimelineEvent: Codable {
    case addedToProject(AddedToProjectEvent)
    case assigned(AssignedEvent)
    case automaticBaseChangeFailed(AutomaticBaseChangeFailedEvent)
    case automaticBaseChangeSucceeded(AutomaticBaseChangeSucceededEvent)
    case baseRefChanged(BaseRefChangedEvent)
    case closed(ClosedEvent)
    case commented(CommentedEvent)
    case committed(CommittedEvent)
    case connected(ConnectedEvent)
    case convertToDraft(ConvertToDraftEvent)
    case convertedNoteToIssue(ConvertedNoteToIssueEvent)
    case convertedToDiscussion(ConvertedToDiscussionEvent)
    case crossReferenced(CrossReferencedEvent)
    case demilestoned(DemilestonedEvent)
    case deployed(DeployedEvent)
    case deploymentEnvironmentChanged(DeploymentEnvironmentChangedEvent)
    case disconnected(DisconnectedEvent)
    case headRefDeleted(HeadRefDeletedEvent)
    case headRefRestored(HeadRefRestoredEvent)
    case headRefForcePushed(HeadRefForcePushedEvent)
    case labeled(LabeledEvent)
    case locked(LockedEvent)
    case mentioned(MentionedEvent)
    case markedAsDuplicate(MarkedAsDuplicateEvent)
    case merged(MergedEvent)
    case milestoned(MilestonedEvent)
    case movedColumnsInProject(MovedColumnsInProjectEvent)
    case pinned(PinnedEvent)
    case readyForReview(ReadyForReviewEvent)
    case referenced(ReferencedEvent)
    case removedFromProject(RemovedFromProjectEvent)
    case renamed(RenamedEvent)
    case reopened(ReopenedEvent)
    case reviewDismissed(ReviewDismissedEvent)
    case reviewRequested(ReviewRequestedEvent)
    case reviewRequestRemoved(ReviewRequestRemovedEvent)
    case reviewed(ReviewedEvent)
    case subscribed(SubscribedEvent)
    case transferred(TransferredEvent)
    case unassigned(UnassignedEvent)
    case unlabeled(UnlabeledEvent)
    case unlocked(UnlockedEvent)
    case unmarkedAsDuplicate(UnmarkedAsDuplicateEvent)
    case unpinned(UnpinnedEvent)
    case unSubscribed(UnSubscribedEvent)
    case userBlocked(UserBlockedEvent)

    // Custom coding logic
    enum CodingKeys: String, CodingKey {
        case type = "event"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type = try container.decode(String.self, forKey: .type)

        switch type {
            case "added_to_project":
                let event = try AddedToProjectEvent(from: decoder)
                self = .addedToProject(event)
            case "assigned":
                let event = try AssignedEvent(from: decoder)
                self = .assigned(event)
            case "automatic_base_change_failed":
                let event = try AutomaticBaseChangeFailedEvent(from: decoder)
                self = .automaticBaseChangeFailed(event)

            case "automatic_base_change_succeeded":
                let event = try AutomaticBaseChangeSucceededEvent(from: decoder)
                self = .automaticBaseChangeSucceeded(event)
            case "base_ref_changed":
                let event = try BaseRefChangedEvent(from: decoder)
                self = .baseRefChanged(event)
            case "closed":
                let event = try ClosedEvent(from: decoder)
                self = .closed(event)
            case "commented":
                let event = try CommentedEvent(from: decoder)
                self = .commented(event)
            case "committed":
                let event = try CommittedEvent(from: decoder)
                self = .committed(event)
            case "connected":
                let event = try ConnectedEvent(from: decoder)
                self = .connected(event)
            case "convert_to_draft":
                let event = try ConvertToDraftEvent(from: decoder)
                self = .convertToDraft(event)
            case "converted_note_to_issue":
                let event = try ConvertedNoteToIssueEvent(from: decoder)
                self = .convertedNoteToIssue(event)
            case "converted_to_discussion":
                let event = try ConvertedToDiscussionEvent(from: decoder)
                self = .convertedToDiscussion(event)
            case "cross-referenced":
                let event = try CrossReferencedEvent(from: decoder)
                self = .crossReferenced(event)
            case "demilestoned":
                let event = try DemilestonedEvent(from: decoder)
                self = .demilestoned(event)
            case "deployed":
                let event = try DeployedEvent(from: decoder)
                self = .deployed(event)
            case "deployment_environment_changed":
                let event = try DeploymentEnvironmentChangedEvent(from: decoder)
                self = .deploymentEnvironmentChanged(event)
            case "disconnected":
                let event = try DisconnectedEvent(from: decoder)
                self = .disconnected(event)
            case "head_ref_deleted":
                let event = try HeadRefDeletedEvent(from: decoder)
                self = .headRefDeleted(event)
            case "head_ref_restored":
                let event = try HeadRefRestoredEvent(from: decoder)
                self = .headRefRestored(event)
            case "head_ref_force_pushed":
                let event = try HeadRefForcePushedEvent(from: decoder)
                self = .headRefForcePushed(event)
            case "labeled":
                let event = try LabeledEvent(from: decoder)
                self = .labeled(event)
            case "locked":
                let event = try LockedEvent(from: decoder)
                self = .locked(event)
            case "mentioned":
                let event = try MentionedEvent(from: decoder)
                self = .mentioned(event)
            case "marked_as_duplicate":
                let event = try MarkedAsDuplicateEvent(from: decoder)
                self = .markedAsDuplicate(event)
            case "merged":
                let event = try MergedEvent(from: decoder)
                self = .merged(event)
            case "milestoned":
                let event = try MilestonedEvent(from: decoder)
                self = .milestoned(event)
            case "moved_columns_in_project":
                let event = try MovedColumnsInProjectEvent(from: decoder)
                self = .movedColumnsInProject(event)
            case "pinned":
                let event = try PinnedEvent(from: decoder)
                self = .pinned(event)
            case "ready_for_review":
                let event = try ReadyForReviewEvent(from: decoder)
                self = .readyForReview(event)
            case "referenced":
                let event = try ReferencedEvent(from: decoder)
                self = .referenced(event)
            case "removed_from_project":
                let event = try RemovedFromProjectEvent(from: decoder)
                self = .removedFromProject(event)
            case "renamed":
                let event = try RenamedEvent(from: decoder)
                self = .renamed(event)
            case "reopened":
                let event = try ReopenedEvent(from: decoder)
                self = .reopened(event)
            case "review_dismissed":
                let event = try ReviewDismissedEvent(from: decoder)
                self = .reviewDismissed(event)
            case "review_requested":
                let event = try ReviewRequestedEvent(from: decoder)
                self = .reviewRequested(event)
            case "review_request_removed":
                let event = try ReviewRequestRemovedEvent(from: decoder)
                self = .reviewRequestRemoved(event)
            case "reviewed":
                let event = try ReviewedEvent(from: decoder)
                self = .reviewed(event)
            case "subscribed":
                let event = try SubscribedEvent(from: decoder)
                self = .subscribed(event)
            case "transferred":
                let event = try TransferredEvent(from: decoder)
                self = .transferred(event)
            case "unassigned":
                let event = try UnassignedEvent(from: decoder)
                self = .unassigned(event)
            case "unlabeled":
                let event = try UnlabeledEvent(from: decoder)
                self = .unlabeled(event)
            case "unlocked":
                let event = try UnlockedEvent(from: decoder)
                self = .unlocked(event)
            case "unmarked_as_duplicate":
                let event = try UnmarkedAsDuplicateEvent(from: decoder)
                self = .unmarkedAsDuplicate(event)
            case "unpinned":
                let event = try UnpinnedEvent(from: decoder)
                self = .unpinned(event)
            case "unsubscribed":
                let event = try UnSubscribedEvent(from: decoder)
                self = .unSubscribed(event)
            case "user_blocked":
                let event = try UserBlockedEvent(from: decoder)
                self = .userBlocked(event)


        default:
            throw DecodingError.dataCorruptedError(forKey: .type, in: container, debugDescription: "Unknown animal type")
        }
    }

    // Encode function to conform to Codable
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
            case .addedToProject(let event):
                try container.encode("added_to_project", forKey: .type)
                try event.encode(to: encoder)
            case .assigned(let event):
                try container.encode("assigned", forKey: .type)
                try event.encode(to: encoder)
            case .automaticBaseChangeFailed(let event):
                try container.encode("automatic_base_change_failed", forKey: .type)
                try event.encode(to: encoder)
            case .automaticBaseChangeSucceeded(let event):
                try container.encode("automatic_base_change_succeeded", forKey: .type)
                try event.encode(to: encoder)
            case .baseRefChanged(let event):
                try container.encode("base_ref_changed", forKey: .type)
                try event.encode(to: encoder)
            case .closed(let event):
                try container.encode("closed", forKey: .type)
                try event.encode(to: encoder)
            case .commented(let event):
                try container.encode("commented", forKey: .type)
                try event.encode(to: encoder)
            case .committed(let event):
                try container.encode("committed", forKey: .type)
                try event.encode(to: encoder)
            case .connected(let event):
                try container.encode("connected", forKey: .type)
                try event.encode(to: encoder)
            case .convertToDraft(let event):
                try container.encode("convert_to_draft", forKey: .type)
                try event.encode(to: encoder)
            case .convertedNoteToIssue(let event):
                try container.encode("converted_note_to_issue", forKey: .type)
                try event.encode(to: encoder)
            case .convertedToDiscussion(let event):
                try container.encode("converted_to_discussion", forKey: .type)
                try event.encode(to: encoder)
            case .crossReferenced(let event):
                try container.encode("cross-referenced", forKey: .type)
                try event.encode(to: encoder)
            case .demilestoned(let event):
                try container.encode("demilestoned", forKey: .type)
                try event.encode(to: encoder)
            case .deployed(let event):
                try container.encode("deployed", forKey: .type)
                try event.encode(to: encoder)
            case .deploymentEnvironmentChanged(let event):
                try container.encode("deployment_environment_changed", forKey: .type)
                try event.encode(to: encoder)
            case .disconnected(let event):
                try container.encode("disconnected", forKey: .type)
                try event.encode(to: encoder)
            case .headRefDeleted(let event):
                try container.encode("head_ref_deleted", forKey: .type)
                try event.encode(to: encoder)
            case .headRefRestored(let event):
                try container.encode("head_ref_restored", forKey: .type)
                try event.encode(to: encoder)
            case .headRefForcePushed(let event):
                try container.encode("head_ref_force_pushed", forKey: .type)
                try event.encode(to: encoder)
            case .labeled(let event):
                try container.encode("labeled", forKey: .type)
                try event.encode(to: encoder)
            case .locked(let event):
                try container.encode("locked", forKey: .type)
                try event.encode(to: encoder)
            case .mentioned(let event):
                try container.encode("mentioned", forKey: .type)
                try event.encode(to: encoder)
            case .markedAsDuplicate(let event):
                try container.encode("marked_as_duplicate", forKey: .type)
                try event.encode(to: encoder)
            case .merged(let event):
                try container.encode("merged", forKey: .type)
                try event.encode(to: encoder)
            case .milestoned(let event):
                try container.encode("milestoned", forKey: .type)
                try event.encode(to: encoder)
            case .movedColumnsInProject(let event):
                try container.encode("moved_columns_in_project", forKey: .type)
                try event.encode(to: encoder)
            case .pinned(let event):
                try container.encode("pinned", forKey: .type)
                try event.encode(to: encoder)
            case .readyForReview(let event):
                try container.encode("ready_for_review", forKey: .type)
                try event.encode(to: encoder)
            case .referenced(let event):
                try container.encode("referenced", forKey: .type)
                try event.encode(to: encoder)
            case .removedFromProject(let event):
                try container.encode("removed_from_project", forKey: .type)
                try event.encode(to: encoder)
            case .renamed(let event):
                try container.encode("renamed", forKey: .type)
                try event.encode(to: encoder)
            case .reopened(let event):
                try container.encode("reopened", forKey: .type)
                try event.encode(to: encoder)
            case .reviewDismissed(let event):
                try container.encode("review_dismissed", forKey: .type)
                try event.encode(to: encoder)
            case .reviewRequested(let event):
                try container.encode("review_requested", forKey: .type)
                try event.encode(to: encoder)
            case .reviewRequestRemoved(let event):
                try container.encode("review_request_removed", forKey: .type)
                try event.encode(to: encoder)
            case .reviewed(let event):
                try container.encode("reviewed", forKey: .type)
                try event.encode(to: encoder)
            case .subscribed(let event):
                try container.encode("subscribed", forKey: .type)
                try event.encode(to: encoder)
            case .transferred(let event):
                try container.encode("transferred", forKey: .type)
                try event.encode(to: encoder)
            case .unassigned(let event):
                try container.encode("unassigned", forKey: .type)
                try event.encode(to: encoder)
            case .unlabeled(let event):
                try container.encode("unlabeled", forKey: .type)
                try event.encode(to: encoder)
            case .unlocked(let event):
                try container.encode("unlocked", forKey: .type)
                try event.encode(to: encoder)
            case .unmarkedAsDuplicate(let event):
                try container.encode("unmarked_as_duplicate", forKey: .type)
                try event.encode(to: encoder)
            case .unpinned(let event):
                try container.encode("unpinned", forKey: .type)
                try event.encode(to: encoder)
            case .unSubscribed(let event):
                try container.encode("unsubscribed", forKey: .type)
                try event.encode(to: encoder)
            case .userBlocked(let event):
                try container.encode("user_blocked", forKey: .type)
                try event.encode(to: encoder)
                
        }
    }

}


// Protocol for all events that can be returned by the timeline
// https://docs.github.com/en/rest/using-the-rest-api/issue-event-types#issue-event-object-common-properties
// Almost all events share these properties
protocol BaseIssuePayload: Codable {
    var id: Int { get }
    var url: URL? { get }
    var actor: User? { get }
    var event: String { get }
    var commitId: String? { get }
    var commitUrl: URL? { get }
    var createdAt: Date? { get }

}

// Base Implementation for events that do not have additional properties
// Override this with an empty subclass to conform to the protocol
// Used for events that do not have additional properties
open class BaseIssuePayloadImpl: BaseIssuePayload {

    open private(set) var id: Int
    open var url: URL?
    open var actor: User?
    open var event: String
    open var commitId: String?
    open var commitUrl: URL?
    open var createdAt: Date?

    init(id: Int, url: URL? = nil, actor: User? = nil, event: String, commitId: String? = nil, commitUrl: URL? = nil, createdAt: Date? = nil) {
        self.id = id
        self.url = url
        self.actor = actor
        self.event = event
        self.commitId = commitId
        self.commitUrl = commitUrl
        self.createdAt = createdAt
    }

    enum CodingKeys: String, CodingKey {
        case id
        case url
        case actor
        case event
        case commitId = "commit_id"
        case commitUrl = "commit_url"
        case createdAt = "created_at"
    }

}


open class AddedToProjectEvent: BaseIssuePayload {

    open private(set) var id: Int
    open var url: URL?
    open var actor: User?
    open var event: String
    open var commitId: String?
    open var commitUrl: URL?
    open var createdAt: Date?

    // AddedToProjectEvent specific

    open var projectId: Int
    open var projectUrl: URL
    open var columnName: String

    enum CodingKeys: String, CodingKey {
        case id
        case url
        case actor
        case event
        case commitId = "commit_id"
        case commitUrl = "commit_url"
        case createdAt = "created_at"
        case projectId = "project_id"
        case projectUrl = "project_url"
        case columnName = "column_name"
    }

}

open class AssignedEvent: BaseIssuePayload {

    open private(set) var id: Int
    open var url: URL?
    open var actor: User?
    open var event: String
    open var commitId: String?
    open var commitUrl: URL?
    open var createdAt: Date?

    // AssignedEvent specific

    open var assignee: User?
    open var assigner: User?

    enum CodingKeys: String, CodingKey {
        case id
        case url
        case actor
        case event
        case commitId = "commit_id"
        case commitUrl = "commit_url"
        case createdAt = "created_at"
        case assignee
        case assigner
    }

}


open class AutomaticBaseChangeFailedEvent: BaseIssuePayloadImpl {}
open class AutomaticBaseChangeSucceededEvent: BaseIssuePayloadImpl {}
open class BaseRefChangedEvent: BaseIssuePayloadImpl {}
open class ClosedEvent: BaseIssuePayloadImpl {}


open class CommentedEvent: Codable {
    open private(set) var id: Int
    open var url: URL?
    open var htmlUrl: URL?
    open var issueUrl: URL?
    open var actor: User?
    open var user: User?
    open var event: String
    open var createdAt: Date?
    open var updatedAt: Date?
    open var authorAssociation: String?
    open var body: String

    enum CodingKeys: String, CodingKey {
        case id
        case url
        case htmlUrl = "html_url"
        case issueUrl = "issue_url"
        case actor
        case user
        case event
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case authorAssociation = "author_association"
        case body
    }

}

public struct Tree: Codable {
    public var sha: String
    public var url: URL?
    public var htmlUrl: URL?
}


open class CommittedEvent: Codable {
    open var sha: String
    open var url: URL?
    open var htmlUrl: URL?
    open var author: User?
    open var committer: User?
    open var tree: Tree
    open var message: String
    open var parents: [Tree]
    open var event: String


}


open class ConnectedEvent: BaseIssuePayloadImpl {}
open class ConvertToDraftEvent: BaseIssuePayloadImpl {}
open class ConvertedNoteToIssueEvent: AddedToProjectEvent {}
open class ConvertedToDiscussionEvent: BaseIssuePayloadImpl {}

public struct CrossReferenceSource: Codable {
    public var type: String
    public var issue: Issue?
}

open class CrossReferencedEvent: Codable {
    open var actor: User?
    open var createdAt: Date?
    open var updatedAt: Date?
    open var event: String
    open var source: CrossReferenceSource
}


open class DemilestonedEvent: BaseIssuePayload {
    open private(set) var id: Int
    open var url: URL?
    open var actor: User?
    open var event: String
    open var commitId: String?
    open var commitUrl: URL?
    open var createdAt: Date?

    // DemilestonedEvent specific
    open var milestone: Milestone


    enum CodingKeys: String, CodingKey {
        case id
        case url
        case actor
        case event
        case commitId = "commit_id"
        case commitUrl = "commit_url"
        case createdAt = "created_at"
        case milestone
    }

}


open class DeployedEvent: BaseIssuePayloadImpl {}
open class DeploymentEnvironmentChangedEvent: BaseIssuePayloadImpl {}
open class DisconnectedEvent: BaseIssuePayloadImpl {}
open class HeadRefDeletedEvent: BaseIssuePayloadImpl {}
open class HeadRefRestoredEvent: BaseIssuePayloadImpl {}
open class HeadRefForcePushedEvent: BaseIssuePayloadImpl {}

open class LabeledEvent: BaseIssuePayload {
    open private(set) var id: Int
    open var url: URL?
    open var actor: User?
    open var event: String
    open var commitId: String?
    open var commitUrl: URL?
    open var createdAt: Date?

    // LabeledEvent specific
    open var label: Label

    enum CodingKeys: String, CodingKey {
        case id
        case url
        case actor
        case event
        case commitId = "commit_id"
        case commitUrl = "commit_url"
        case createdAt = "created_at"
        case label
    }

}

open class LockedEvent: BaseIssuePayload {
    open private(set) var id: Int
    open var url: URL?
    open var actor: User?
    open var event: String
    open var commitId: String?
    open var commitUrl: URL?
    open var createdAt: Date?

    // LockedEvent specific
    open var lockReason: String?

    enum CodingKeys: String, CodingKey {
        case id
        case url
        case actor
        case event
        case commitId = "commit_id"
        case commitUrl = "commit_url"
        case createdAt = "created_at"
        case lockReason = "lock_reason"
    }

}

open class MentionedEvent: BaseIssuePayloadImpl {}
open class MarkedAsDuplicateEvent: BaseIssuePayloadImpl {}
open class MergedEvent: BaseIssuePayloadImpl {}
open class MilestonedEvent: DemilestonedEvent {}


open class MovedColumnsInProjectEvent: BaseIssuePayload {
    open private(set) var id: Int
    open var url: URL?
    open var actor: User?
    open var event: String
    open var commitId: String?
    open var commitUrl: URL?
    open var createdAt: Date?

    // MovedColumnsInProjectEvent specific

    open var projectId: Int
    open var projectUrl: URL
    open var columnName: String
    open var previousColumnName: String

    enum CodingKeys: String, CodingKey {
        case id
        case url
        case actor
        case event
        case commitId = "commit_id"
        case commitUrl = "commit_url"
        case createdAt = "created_at"
        case projectId = "project_id"
        case projectUrl = "project_url"
        case columnName = "column_name"
        case previousColumnName = "previous_column_name"
    }
}


open class PinnedEvent: BaseIssuePayloadImpl {}
open class ReadyForReviewEvent: BaseIssuePayloadImpl {}
open class ReferencedEvent: BaseIssuePayloadImpl {}
open class RemovedFromProjectEvent: AddedToProjectEvent {}


public struct RenamedTitle: Codable {
    public var from: String
    public var to: String
}

open class RenamedEvent: BaseIssuePayload {
    open private(set) var id: Int
    open var url: URL?
    open var actor: User?
    open var event: String
    open var commitId: String?
    open var commitUrl: URL?
    open var createdAt: Date?

    // RenamedEvent specific
    open var rename: RenamedTitle

    enum CodingKeys: String, CodingKey {
        case id
        case url
        case actor
        case event
        case commitId = "commit_id"
        case commitUrl = "commit_url"
        case createdAt = "created_at"
        case rename
    }

}


open class ReopenedEvent: BaseIssuePayloadImpl {}

open class ReviewDismissedEvent: BaseIssuePayload {
    open private(set) var id: Int
    open var url: URL?
    open var actor: User?
    open var event: String
    open var commitId: String?
    open var commitUrl: URL?
    open var createdAt: Date?

    // ReviewDismissedEvent specific
    open var review: Review

    enum CodingKeys: String, CodingKey {
        case id
        case url
        case actor
        case event
        case commitId = "commit_id"
        case commitUrl = "commit_url"
        case createdAt = "created_at"
        case review = "dismissed_review"
    }

}

open class ReviewRequestedEvent: BaseIssuePayload {
    open private(set) var id: Int
    open var url: URL?
    open var actor: User?
    open var event: String
    open var commitId: String?
    open var commitUrl: URL?
    open var createdAt: Date?

    // ReviewRequestedEvent specific
    open var requestedReviewer: User
    open var reviewRequester: User

    enum CodingKeys: String, CodingKey {
        case id
        case url
        case actor
        case event
        case commitId = "commit_id"
        case commitUrl = "commit_url"
        case createdAt = "created_at"
        case requestedReviewer = "requested_reviewer"
        case reviewRequester = "review_requester"
    }

}


open class ReviewRequestRemovedEvent: ReviewRequestedEvent {}


open class ReviewedEvent: Codable {
    open private(set) var id: Int
    open var user: User?
    open var body: String?
    open var commitId: String?
    open var submittedAt: Date?
    open var state: Review.State
    open var htmlUrl: URL?
    open var pullRequestUrl: URL?
    open var authorAssociation: String?
    open var event: String
}


open class SubscribedEvent: BaseIssuePayloadImpl {}
open class TransferredEvent: BaseIssuePayloadImpl {}
open class UnassignedEvent: AssignedEvent {}
open class UnlabeledEvent: LabeledEvent {}
open class UnlockedEvent: LockedEvent {}
open class UnmarkedAsDuplicateEvent: BaseIssuePayloadImpl {}
open class UnpinnedEvent: PinnedEvent {}
open class UnSubscribedEvent: SubscribedEvent {}
open class UserBlockedEvent: BaseIssuePayloadImpl {}
