# frozen_string_literal: true

module HelloWorldTestingggg
  [
    HelloWorldTestingggg::Internal::Type::BaseModel,
    *HelloWorldTestingggg::Internal::Type::BaseModel.subclasses
  ].each do |cls|
    cls.define_sorbet_constant!(:OrHash) { T.type_alias { T.any(cls, HelloWorldTestingggg::Internal::AnyHash) } }
  end

  HelloWorldTestingggg::Internal::Util.walk_namespaces(HelloWorldTestingggg::Models).each do |mod|
    case mod
    in HelloWorldTestingggg::Internal::Type::Enum | HelloWorldTestingggg::Internal::Type::Union
      mod.constants.each do |name|
        case mod.const_get(name)
        in true | false
          mod.define_sorbet_constant!(:TaggedBoolean) { T.type_alias { T::Boolean } }
          mod.define_sorbet_constant!(:OrBoolean) { T.type_alias { T::Boolean } }
        in Integer
          mod.define_sorbet_constant!(:TaggedInteger) { T.type_alias { Integer } }
          mod.define_sorbet_constant!(:OrInteger) { T.type_alias { Integer } }
        in Float
          mod.define_sorbet_constant!(:TaggedFloat) { T.type_alias { Float } }
          mod.define_sorbet_constant!(:OrFloat) { T.type_alias { Float } }
        in Symbol
          mod.define_sorbet_constant!(:TaggedSymbol) { T.type_alias { Symbol } }
          mod.define_sorbet_constant!(:OrSymbol) { T.type_alias { T.any(Symbol, String) } }
        else
        end
      end
    else
    end
  end

  HelloWorldTestingggg::Internal::Util.walk_namespaces(HelloWorldTestingggg::Models)
                                      .lazy
                                      .grep(HelloWorldTestingggg::Internal::Type::Union)
                                      .each do |mod|
    const = :Variants
    next if mod.sorbet_constant_defined?(const)

    mod.define_sorbet_constant!(const) { T.type_alias { mod.to_sorbet_type } }
  end

  Address = HelloWorldTestingggg::Models::Address

  AdoptionCreateParams = HelloWorldTestingggg::Models::AdoptionCreateParams

  AdoptionRetrieveDecisionParams = HelloWorldTestingggg::Models::AdoptionRetrieveDecisionParams

  AdoptionRetrieveParams = HelloWorldTestingggg::Models::AdoptionRetrieveParams

  Adoptions = HelloWorldTestingggg::Models::Adoptions

  AdoptionsPolicyChangedWebhookEvent = HelloWorldTestingggg::Models::AdoptionsPolicyChangedWebhookEvent

  AIAIQueryParams = HelloWorldTestingggg::Models::AIAIQueryParams

  Application = HelloWorldTestingggg::Models::Application

  Archive = HelloWorldTestingggg::Models::Archive

  ClientHealthParams = HelloWorldTestingggg::Models::ClientHealthParams

  ClientRetrieveRateLimitsParams = HelloWorldTestingggg::Models::ClientRetrieveRateLimitsParams

  File = HelloWorldTestingggg::Models::File

  FileCreateArchiveParams = HelloWorldTestingggg::Models::FileCreateArchiveParams

  FileDeleteParams = HelloWorldTestingggg::Models::FileDeleteParams

  FileDownloadParams = HelloWorldTestingggg::Models::FileDownloadParams

  FileListParams = HelloWorldTestingggg::Models::FileListParams

  Fileslist = HelloWorldTestingggg::Models::Fileslist

  FileUpdateParams = HelloWorldTestingggg::Models::FileUpdateParams

  FileUploadDirectParams = HelloWorldTestingggg::Models::FileUploadDirectParams

  FileUploadParams = HelloWorldTestingggg::Models::FileUploadParams

  MediaBinaryAndJsonParams = HelloWorldTestingggg::Models::MediaBinaryAndJsonParams

  MediaJsonAndXmlParams = HelloWorldTestingggg::Models::MediaJsonAndXmlParams

  MediaJsonFirstParams = HelloWorldTestingggg::Models::MediaJsonFirstParams

  MediaSchemaOnJsonParams = HelloWorldTestingggg::Models::MediaSchemaOnJsonParams

  MediaSchemaOnTextParams = HelloWorldTestingggg::Models::MediaSchemaOnTextParams

  MediaTextFirstParams = HelloWorldTestingggg::Models::MediaTextFirstParams

  MediaTextOnlyParams = HelloWorldTestingggg::Models::MediaTextOnlyParams

  MediaVendorJsonParams = HelloWorldTestingggg::Models::MediaVendorJsonParams

  MedicalSummary = HelloWorldTestingggg::Models::MedicalSummary

  Money = HelloWorldTestingggg::Models::Money

  Notifications = HelloWorldTestingggg::Models::Notifications

  ParsedWebhookEvent = HelloWorldTestingggg::Models::ParsedWebhookEvent

  PetAPI = HelloWorldTestingggg::Models::PetAPI

  PetConnectParams = HelloWorldTestingggg::Models::PetConnectParams

  PetCreatedWebhookEvent = HelloWorldTestingggg::Models::PetCreatedWebhookEvent

  PetCreateParams = HelloWorldTestingggg::Models::PetCreateParams

  PetDeleteParams = HelloWorldTestingggg::Models::PetDeleteParams

  PetFindByStatusParams = HelloWorldTestingggg::Models::PetFindByStatusParams

  PetFindByTagsParams = HelloWorldTestingggg::Models::PetFindByTagsParams

  PetInventoryLowWebhookEvent = HelloWorldTestingggg::Models::PetInventoryLowWebhookEvent

  PetListFakePageInferredParams = HelloWorldTestingggg::Models::PetListFakePageInferredParams

  PetListFakePageParams = HelloWorldTestingggg::Models::PetListFakePageParams

  PetListParams = HelloWorldTestingggg::Models::PetListParams

  PetListUnpaginatedParams = HelloWorldTestingggg::Models::PetListUnpaginatedParams

  PetModerationWebhookEvent = HelloWorldTestingggg::Models::PetModerationWebhookEvent

  PetRetrieveParams = HelloWorldTestingggg::Models::PetRetrieveParams

  PetRetrievePremiumParams = HelloWorldTestingggg::Models::PetRetrievePremiumParams

  PetSearchParams = HelloWorldTestingggg::Models::PetSearchParams

  PetStatus = HelloWorldTestingggg::Models::PetStatus

  PetUpdatedWebhookEvent = HelloWorldTestingggg::Models::PetUpdatedWebhookEvent

  PetUpdateParams = HelloWorldTestingggg::Models::PetUpdateParams

  PetUpdateWithFormParams = HelloWorldTestingggg::Models::PetUpdateWithFormParams

  PetUploadImageParams = HelloWorldTestingggg::Models::PetUploadImageParams

  PetWatchStatusParams = HelloWorldTestingggg::Models::PetWatchStatusParams

  Placement = HelloWorldTestingggg::Models::Placement

  PlacementCreateParams = HelloWorldTestingggg::Models::PlacementCreateParams

  PlacementEvent = HelloWorldTestingggg::Models::PlacementEvent

  PlacementEventRecordedWebhookEvent = HelloWorldTestingggg::Models::PlacementEventRecordedWebhookEvent

  PlacementListParams = HelloWorldTestingggg::Models::PlacementListParams

  PlacementRecordEventParams = HelloWorldTestingggg::Models::PlacementRecordEventParams

  PlacementRetrieveParams = HelloWorldTestingggg::Models::PlacementRetrieveParams

  Profile = HelloWorldTestingggg::Models::Profile

  ProfileCreateParams = HelloWorldTestingggg::Models::ProfileCreateParams

  ProfileCreateRequest = HelloWorldTestingggg::Models::ProfileCreateRequest

  ProfileLegacySearchParams = HelloWorldTestingggg::Models::ProfileLegacySearchParams

  ProfileRetrieveParams = HelloWorldTestingggg::Models::ProfileRetrieveParams

  ProfileUpdateParams = HelloWorldTestingggg::Models::ProfileUpdateParams

  Store = HelloWorldTestingggg::Models::Store

  StoreListInventoryParams = HelloWorldTestingggg::Models::StoreListInventoryParams

  StoreReportGeneratedWebhookEvent = HelloWorldTestingggg::Models::StoreReportGeneratedWebhookEvent

  SystemHealth = HelloWorldTestingggg::Models::SystemHealth

  TransferLeg = HelloWorldTestingggg::Models::TransferLeg

  UserCreateParams = HelloWorldTestingggg::Models::UserCreateParams

  UserCreateWithListParams = HelloWorldTestingggg::Models::UserCreateWithListParams

  UserDeleteParams = HelloWorldTestingggg::Models::UserDeleteParams

  UserLoginParams = HelloWorldTestingggg::Models::UserLoginParams

  UserLogoutParams = HelloWorldTestingggg::Models::UserLogoutParams

  UserRetrieveParams = HelloWorldTestingggg::Models::UserRetrieveParams

  UserUpdateParams = HelloWorldTestingggg::Models::UserUpdateParams

  UserVerifyIdentityParams = HelloWorldTestingggg::Models::UserVerifyIdentityParams

  VaccinationRecord = HelloWorldTestingggg::Models::VaccinationRecord

  WebhookParsedParams = HelloWorldTestingggg::Models::WebhookParsedParams
end
