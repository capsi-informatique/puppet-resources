# resources

Allow creating resources directly from Hiera

## Table of Contents

1. [Description](#description)
1. [Usage - Configuration options and additional functionality](#usage)
1. [Development - Guide for contributing to the module](#development)

## Description

With this module, you can create a Hash in your Hiera files to automatically create the corresponding ressouces in
Puppet via the `create_resources` function.

### Usage

You just need to include the class in your puppet code or in Hiera if you configured it :

#### In your Puppet code

```puppet
include resources

# OR

class { resources:
}
```

#### In Hiera

`site.pp`:
```puppet
lookup('classes', { merge => unique, default_value => [] }).include
```

`hiera.yaml`:
```yaml
---
classes:
  - resources
```

## Usage

You can change the merge behavior of the lookup, by default, no merge behavior is set and the one set in Hiera is used:
```yaml
resources::merge_behavior: deep
```
Or:
```puppet
class { resources:
  merge_behavior => deep,
}
```

Once you included the class, you can declare the resources like this:
```yaml
resources:
  resource_type:
    resource_tittle:
      arg1: 'string value'
      arg2: 123
      arg3: false
```

You can check the [examples/hiera.yaml](examples/hiera.yaml) for a real world examples

## Release Notes/Contributors/Etc. **Optional**

### Release 1.0.0

Initial Release
