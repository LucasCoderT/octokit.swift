import Foundation

public enum TimelineEventTypes: String, Decodable {
    case addedToProject = "added_to_project"
    case assigned = "assigned"
    case automaticBaseChangeFailed = "automatic_base_change_failed"
    case automaticBaseChangeSucceeded = "automatic_base_change_succeeded"
    case baseRefChanged = "base_ref_changed"
    case closed = "closed"
    case commented = "commented"
    case committed = "committed"
    case connected = "connected"
    case convertToDraft = "convert_to_draft"
    case convertedNoteToIssue = "converted_note_to_issue"
    case convertedToDiscussion = "converted_to_discussion"
    case crossReferenced = "cross-referenced"
    case demilestoned = "demilestoned"
    case deployed = "deployed"
    case deploymentEnvironmentChanged = "deployment_environment_changed"
    case disconnected = "disconnected"
    case headRefDeleted = "head_ref_deleted"
    case headRefRestored = "head_ref_restored"
    case headRefForcePushed = "head_ref_force_pushed"
    case labeled = "labeled"
    case locked = "locked"
    case mentioned = "mentioned"
    case markedAsDuplicate = "marked_as_duplicate"
    case merged = "merged"
    case milestoned = "milestoned"
    case movedColumnsInProject = "moved_columns_in_project"
    case pinned = "pinned"
    case readyForReview = "ready_for_review"
    case referenced = "referenced"
    case removedFromProject = "removed_from_project"
    case renamed = "renamed"
    case reopened = "reopened"
    case reviewDismissed = "review_dismissed"
    case reviewRequested = "review_requested"
    case reviewRequestRemoved = "review_request_removed"
    case reviewed = "reviewed"
    case subscribed = "subscribed"
    case transferred = "transferred"
    case unassigned = "unassigned"
    case unlabeled = "unlabeled"
    case unlocked = "unlocked"
    case unmarkedAsDuplicate = "unmarked_as_duplicate"
    case unpinned = "unpinned"
    case unSubscribed = "unsubscribed"
    case userBlocked = "user_blocked"
}

// Order of events are in order of the API documentation
// https://docs.github.com/en/rest/using-the-rest-api/issue-event-types
public enum TimelineEvent: Decodable {
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
        let type = try container.decode(TimelineEventTypes.self, forKey: .type)
        
        switch type {
            case .addedToProject:
                let event = try AddedToProjectEvent(from: decoder)
                self = .addedToProject(event)
            case .assigned:
                let event = try AssignedEvent(from: decoder)
                self = .assigned(event)
            case .automaticBaseChangeFailed:
                let event = try AutomaticBaseChangeFailedEvent(from: decoder)
                self = .automaticBaseChangeFailed(event)
            case .automaticBaseChangeSucceeded:
                let event = try AutomaticBaseChangeSucceededEvent(from: decoder)
                self = .automaticBaseChangeSucceeded(event)
            case .baseRefChanged:
                let event = try BaseRefChangedEvent(from: decoder)
                self = .baseRefChanged(event)
            case .closed:
                let event = try ClosedEvent(from: decoder)
                self = .closed(event)
            case .commented:
                let event = try CommentedEvent(from: decoder)
                self = .commented(event)
            case .committed:
                let event = try CommittedEvent(from: decoder)
                self = .committed(event)
            case .connected:
                let event = try ConnectedEvent(from: decoder)
                self = .connected(event)
            case .convertToDraft:
                let event = try ConvertToDraftEvent(from: decoder)
                self = .convertToDraft(event)
            case .convertedNoteToIssue:
                let event = try ConvertedNoteToIssueEvent(from: decoder)
                self = .convertedNoteToIssue(event)
            case .convertedToDiscussion:
                let event = try ConvertedToDiscussionEvent(from: decoder)
                self = .convertedToDiscussion(event)
            case .crossReferenced:
                let event = try CrossReferencedEvent(from: decoder)
                self = .crossReferenced(event)
            case .demilestoned:
                let event = try DemilestonedEvent(from: decoder)
                self = .demilestoned(event)
            case .deployed:
                let event = try DeployedEvent(from: decoder)
                self = .deployed(event)
            case .deploymentEnvironmentChanged:
                let event = try DeploymentEnvironmentChangedEvent(from: decoder)
                self = .deploymentEnvironmentChanged(event)
            case .disconnected:
                let event = try DisconnectedEvent(from: decoder)
                self = .disconnected(event)
            case .headRefDeleted:
                let event = try HeadRefDeletedEvent(from: decoder)
                self = .headRefDeleted(event)
            case .headRefRestored:
                let event = try HeadRefRestoredEvent(from: decoder)
                self = .headRefRestored(event)
            case .headRefForcePushed:
                let event = try HeadRefForcePushedEvent(from: decoder)
                self = .headRefForcePushed(event)
            case .labeled:
                let event = try LabeledEvent(from: decoder)
                self = .labeled(event)
            case .locked:
                let event = try LockedEvent(from: decoder)
                self = .locked(event)
            case .mentioned:
                let event = try MentionedEvent(from: decoder)
                self = .mentioned(event)
            case .markedAsDuplicate:
                let event = try MarkedAsDuplicateEvent(from: decoder)
                self = .markedAsDuplicate(event)
            case .merged:
                let event = try MergedEvent(from: decoder)
                self = .merged(event)
            case .milestoned:
                let event = try MilestonedEvent(from: decoder)
                self = .milestoned(event)
            case .movedColumnsInProject:
                let event = try MovedColumnsInProjectEvent(from: decoder)
                self = .movedColumnsInProject(event)
            case .pinned:
                let event = try PinnedEvent(from: decoder)
                self = .pinned(event)
            case .readyForReview:
                let event = try ReadyForReviewEvent(from: decoder)
                self = .readyForReview(event)
            case .referenced:
                let event = try ReferencedEvent(from: decoder)
                self = .referenced(event)
            case .removedFromProject:
                let event = try RemovedFromProjectEvent(from: decoder)
                self = .removedFromProject(event)
            case .renamed:
                let event = try RenamedEvent(from: decoder)
                self = .renamed(event)
            case .reopened:
                let event = try ReopenedEvent(from: decoder)
                self = .reopened(event)
            case .reviewDismissed:
                let event = try ReviewDismissedEvent(from: decoder)
                self = .reviewDismissed(event)
            case .reviewRequested:
                let event = try ReviewRequestedEvent(from: decoder)
                self = .reviewRequested(event)
            case .reviewRequestRemoved:
                let event = try ReviewRequestRemovedEvent(from: decoder)
                self = .reviewRequestRemoved(event)
            case .reviewed:
                let event = try ReviewedEvent(from: decoder)
                self = .reviewed(event)
            case .subscribed:
                let event = try SubscribedEvent(from: decoder)
                self = .subscribed(event)
            case .transferred:
                let event = try TransferredEvent(from: decoder)
                self = .transferred(event)
            case .unassigned:
                let event = try UnassignedEvent(from: decoder)
                self = .unassigned(event)
            case .unlabeled:
                let event = try UnlabeledEvent(from: decoder)
                self = .unlabeled(event)
            case .unlocked:
                let event = try UnlockedEvent(from: decoder)
                self = .unlocked(event)
            case .unmarkedAsDuplicate:
                let event = try UnmarkedAsDuplicateEvent(from: decoder)
                self = .unmarkedAsDuplicate(event)
            case .unpinned:
                let event = try UnpinnedEvent(from: decoder)
                self = .unpinned(event)
            case .unSubscribed:
                let event = try UnSubscribedEvent(from: decoder)
                self = .unSubscribed(event)
            case .userBlocked:
                let event = try UserBlockedEvent(from: decoder)
                self = .userBlocked(event)
        }
    }
    
}


// Protocol for all events that can be returned by the timeline
// https://docs.github.com/en/rest/using-the-rest-api/issue-event-types#issue-event-object-common-properties
// Almost all events share these properties
// Base class for all events
open class BaseTimelineEvent: Decodable {
    open private(set) var id: Int
    open var url: URL?
    open var actor: User?
    open var event: String
    open var commitId: String?
    open var commitUrl: URL?
    open var createdAt: Date?

    enum CodingKeys: String, CodingKey {
        case id
        case url
        case actor
        case event
        case commitId = "commit_id"
        case commitUrl = "commit_url"
        case createdAt = "created_at"
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.url = try container.decodeIfPresent(URL.self, forKey: .url)
        self.actor = try container.decodeIfPresent(User.self, forKey: .actor)
        self.event = try container.decode(String.self, forKey: .event)
        self.commitId = try container.decodeIfPresent(String.self, forKey: .commitId)
        self.commitUrl = try container.decodeIfPresent(URL.self, forKey: .commitUrl)
        self.createdAt = try container.decodeIfPresent(Date.self, forKey: .createdAt)
    }
}

// Events that don't have additional properties
open class BaseIssueEventImpl: BaseTimelineEvent {}


open class AddedToProjectEvent: BaseTimelineEvent {
    // AddedToProjectEvent specific
    
    open var projectId: Int
    open var projectUrl: URL
    open var columnName: String
    
    enum CodingKeys: String, CodingKey {
        case projectId = "project_id"
        case projectUrl = "project_url"
        case columnName = "column_name"
    }
    
    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.projectId = try container.decode(Int.self, forKey: .projectId)
        self.projectUrl = try container.decode(URL.self, forKey: .projectUrl)
        self.columnName = try container.decode(String.self, forKey: .columnName)
        
        try super.init(from: decoder)

    }
    
}

open class AssignedEvent: BaseTimelineEvent {
    // AssignedEvent specific
    
    open var assignee: User?
    open var assigner: User?
    
    enum CodingKeys: String, CodingKey {
        case assignee
        case assigner
    }
    
    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.assignee = try container.decodeIfPresent(User.self, forKey: .assignee)
        self.assigner = try container.decodeIfPresent(User.self, forKey: .assigner)
    }
}


open class AutomaticBaseChangeFailedEvent: BaseIssueEventImpl {}
open class AutomaticBaseChangeSucceededEvent: BaseIssueEventImpl {}
open class BaseRefChangedEvent: BaseIssueEventImpl {}
open class ClosedEvent: BaseIssueEventImpl {}


open class CommentedEvent: BaseTimelineEvent {
    open var htmlUrl: URL
    open var issueUrl: URL
    open var user: User
    open var updatedAt: Date
    open var authorAssociation: String
    open var body: String
    
    enum CodingKeys: String, CodingKey {
        case htmlUrl = "html_url"
        case issueUrl = "issue_url"
        case user
        case updatedAt = "updated_at"
        case authorAssociation = "author_association"
        case body
    }
    
    required public init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.htmlUrl = try container.decode(URL.self, forKey: .htmlUrl)
        self.issueUrl = try container.decode(URL.self, forKey: .issueUrl)
        self.user = try container.decode(User.self, forKey: .user)
        self.updatedAt = try container.decode(Date.self, forKey: .updatedAt)
        self.authorAssociation = try container.decode(String.self, forKey: .authorAssociation)
        self.body = try container.decode(String.self, forKey: .body)
        
        try super.init(from: decoder)

    }

    
}




open class CommittedEvent: BaseTimelineEvent {
    open var sha: String
    open var htmlUrl: URL?
    open var author: User?
    open var committer: User?
    open var tree: Tree
    open var message: String
    open var parents: [Tree]
    
    public struct Tree: Decodable {
        public var sha: String
        public var url: URL?
        public var htmlUrl: URL?
    }
    
    enum CodingKeys: String, CodingKey {
        case sha
        case htmlUrl = "html_url"
        case author
        case committer
        case tree
        case message
        case parents
    }
    
    required public init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.sha = try container.decode(String.self, forKey: .sha)
        self.htmlUrl = try container.decodeIfPresent(URL.self, forKey: .htmlUrl)
        self.author = try container.decodeIfPresent(User.self, forKey: .author)
        self.committer = try container.decodeIfPresent(User.self, forKey: .committer)
        self.tree = try container.decode(Tree.self, forKey: .tree)
        self.message = try container.decode(String.self, forKey: .message)
        self.parents = try container.decode([Tree].self, forKey: .parents)
        
        try super.init(from: decoder)

    }

    
    
}


open class ConnectedEvent: BaseIssueEventImpl {}
open class ConvertToDraftEvent: BaseIssueEventImpl {}
open class ConvertedNoteToIssueEvent: AddedToProjectEvent {}
open class ConvertedToDiscussionEvent: BaseIssueEventImpl {}


open class CrossReferencedEvent: BaseTimelineEvent {
    open var updatedAt: Date?
    open var source: CrossReferenceSource
    
    public struct CrossReferenceSource: Decodable {
        public var type: String
        public var issue: Issue?
    }
    
    enum CodingKeys: String, CodingKey {
        case updatedAt = "updated_at"
        case source
    }
    
    required public init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.updatedAt = try container.decodeIfPresent(Date.self, forKey: .updatedAt)
        self.source = try container.decode(CrossReferenceSource.self, forKey: .source)
        
        try super.init(from: decoder)

    }

    
}


open class DemilestonedEvent: BaseTimelineEvent {
    // DemilestonedEvent specific
    open var milestone: Milestone
    
    
    enum CodingKeys: String, CodingKey {
        case milestone
    }
    
    required public init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.milestone = try container.decode(Milestone.self, forKey: .milestone)
        
        try super.init(from: decoder)

    }

    
}


open class DeployedEvent: BaseIssueEventImpl {}
open class DeploymentEnvironmentChangedEvent: BaseIssueEventImpl {}
open class DisconnectedEvent: BaseIssueEventImpl {}
open class HeadRefDeletedEvent: BaseIssueEventImpl {}
open class HeadRefRestoredEvent: BaseIssueEventImpl {}
open class HeadRefForcePushedEvent: BaseIssueEventImpl {}

open class LabeledEvent: BaseTimelineEvent {
    // LabeledEvent specific
    open var label: Label
    
    enum CodingKeys: String, CodingKey {
        case label
    }
    
    required public init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.label = try container.decode(Label.self, forKey: .label)
        
        try super.init(from: decoder)

    }

    
}

open class LockedEvent: BaseTimelineEvent {
    
    // LockedEvent specific
    open var lockReason: String?
    
    enum CodingKeys: String, CodingKey {
        case lockReason = "lock_reason"
    }
    
    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.lockReason = try container.decodeIfPresent(String.self, forKey: .lockReason)
    }

    
}

open class MentionedEvent: BaseIssueEventImpl {}
open class MarkedAsDuplicateEvent: BaseIssueEventImpl {}
open class MergedEvent: BaseIssueEventImpl {}
open class MilestonedEvent: DemilestonedEvent {}


open class MovedColumnsInProjectEvent: BaseTimelineEvent {

    // MovedColumnsInProjectEvent specific
    open var projectId: Int
    open var projectUrl: URL
    open var columnName: String
    open var previousColumnName: String
    
    enum CodingKeys: String, CodingKey {
        case projectId = "project_id"
        case projectUrl = "project_url"
        case columnName = "column_name"
        case previousColumnName = "previous_column_name"
    }
    
    required public init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.projectId = try container.decode(Int.self, forKey: .projectId)
        self.projectUrl = try container.decode(URL.self, forKey: .projectUrl)
        self.columnName = try container.decode(String.self, forKey: .columnName)
        self.previousColumnName = try container.decode(String.self, forKey: .previousColumnName)
        
        try super.init(from: decoder)

    }

}


open class PinnedEvent: BaseIssueEventImpl {}
open class ReadyForReviewEvent: BaseIssueEventImpl {}
open class ReferencedEvent: BaseIssueEventImpl {}
open class RemovedFromProjectEvent: AddedToProjectEvent {}




open class RenamedEvent: BaseTimelineEvent {
    
    // RenamedEvent specific
    open var rename: RenamedTitle
    
    public struct RenamedTitle: Decodable {
        public var from: String
        public var to: String
    }
    
    enum CodingKeys: String, CodingKey {
        case rename
    }
    
    required public init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.rename = try container.decode(RenamedTitle.self, forKey: .rename)
        
        try super.init(from: decoder)

    }

}


open class ReopenedEvent: BaseIssueEventImpl {}

open class ReviewDismissedEvent: BaseTimelineEvent {
    
    // ReviewDismissedEvent specific
    open var review: Review
    
    enum CodingKeys: String, CodingKey {
        case review = "dismissed_review"
    }
    
    required public init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.review = try container.decode(Review.self, forKey: .review)
        
        try super.init(from: decoder)

    }

    
}

open class ReviewRequestedEvent: BaseTimelineEvent {
    
    // ReviewRequestedEvent specific
    open var requestedReviewer: User
    open var reviewRequester: User
    
    enum CodingKeys: String, CodingKey {
        case requestedReviewer = "requested_reviewer"
        case reviewRequester = "review_requester"
    }
    
    required public init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.requestedReviewer = try container.decode(User.self, forKey: .requestedReviewer)
        self.reviewRequester = try container.decode(User.self, forKey: .reviewRequester)
        
        try super.init(from: decoder)

    }

    
}


open class ReviewRequestRemovedEvent: ReviewRequestedEvent {}


open class ReviewedEvent: BaseTimelineEvent {
    open var user: User?
    open var body: String?
    open var submittedAt: Date?
    open var state: Review.State
    open var htmlUrl: URL?
    open var pullRequestUrl: URL?
    open var authorAssociation: String?
    
    
    enum CodingKeys: String, CodingKey {
        case user
        case body
        case submittedAt = "submitted_at"
        case state
        case htmlUrl = "html_url"
        case pullRequestUrl = "pull_request_url"
        case authorAssociation = "author_association"
    }
    
    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.user = try container.decodeIfPresent(User.self, forKey: .user)
        self.body = try container.decodeIfPresent(String.self, forKey: .body)
        self.submittedAt = try container.decodeIfPresent(Date.self, forKey: .submittedAt)
        self.state = try container.decode(Review.State.self, forKey: .state)
        self.htmlUrl = try container.decodeIfPresent(URL.self, forKey: .htmlUrl)
        self.pullRequestUrl = try container.decodeIfPresent(URL.self, forKey: .pullRequestUrl)
        self.authorAssociation = try container.decodeIfPresent(String.self, forKey: .authorAssociation)
        
        try super.init(from: decoder)
    }

}


open class SubscribedEvent: BaseIssueEventImpl {}
open class TransferredEvent: BaseIssueEventImpl {}
open class UnassignedEvent: AssignedEvent {}
open class UnlabeledEvent: LabeledEvent {}
open class UnlockedEvent: LockedEvent {}
open class UnmarkedAsDuplicateEvent: BaseIssueEventImpl {}
open class UnpinnedEvent: PinnedEvent {}
open class UnSubscribedEvent: SubscribedEvent {}
open class UserBlockedEvent: BaseIssueEventImpl {}
