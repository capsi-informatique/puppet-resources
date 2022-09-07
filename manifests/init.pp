# @summary Allow to create resources in Hiera without creating a dedicated class or profile
#
# @example
#   include resources
class resources (
  Optional[String] $merge_behavior = undef,
) {
  # Search the resources definition in Hiera
  $resources_root = lookup('resources', Hash[String,Hash[String,Hash[String,Any]]], $merge_behavior, {})

  # For each resources types
  $resources_root.each |String $type, Hash $resources_type_root| {
    # And each title
    $resources_type_root.each |String $title, Hash $content| {
      # Create the corresponding resources
      create_resources($type, { $title => $content })
    }
  }
}
