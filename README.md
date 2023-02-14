# Bug example

Step 1:

`garden plugins terraform apply-module --yes -- terraform-test -input=false -auto-approve`

```
Plugins 


━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
🌍  Running in namespace default.empty
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Running terraform apply for module terraform-test 

ℹ providers                 → Getting status...
✔ providers                 → Getting status... → Cached
   ℹ Run with --force-refresh to force a refresh of provider statuses.
ℹ providers                 → Getting status...
✔ providers                 → Getting status... → Cached
   ℹ Run with --force-refresh to force a refresh of provider statuses.
ℹ graph                     → Resolving 2 modules...
✔ graph                     → Resolving 2 modules... → Done

random_password.test_password: Refreshing state... [id=none]

Changes to Outputs:
  + test_password = (sensitive value)

You can apply this plan to save these new output values to the Terraform state, without changing any real infrastructure.

Apply complete! Resources: 0 added, 0 changed, 0 destroyed.

Outputs:

test_password = <sensitive>
```

Step 2:

`garden --yes -l=silly -o=yaml deploy`

Output should look like:

```
success: true
result:
  builds: {}
  deployments:
    terraform-test:
      state: ready
      version: v-51c823ff3a
      outputs:
        test_password: ++IM7+a+2R8=KY-l2+j4
      detail: {}
      forwardablePorts: []
      aborted: false
      durationMsec: 1
      success: true
    terraform-two:
      state: ready
      version: v-25ab304c6e
      outputs: {}
      detail: {}
      forwardablePorts: []
      aborted: false
      durationMsec: 70
      success: true
  tests: {}
  graphResults:
    stage-build.terraform-two:
      type: stage-build
      key: stage-build.terraform-two
      name: terraform-two
      description: staging build for terraform-two
      completedAt: '2023-02-14T02:41:35.042Z'
      batchId: 3ae21720-63eb-4ca9-9671-d79365f34aec
      output: {}
      dependencyResults: {}
      version: v-183b32bac6
      startedAt: '2023-02-14T02:41:35.027Z'
    stage-build.terraform-test:
      type: stage-build
      key: stage-build.terraform-test
      name: terraform-test
      description: staging build for terraform-test
      completedAt: '2023-02-14T02:41:35.044Z'
      batchId: 3ae21720-63eb-4ca9-9671-d79365f34aec
      output: {}
      dependencyResults: {}
      version: v-585a145e21
      startedAt: '2023-02-14T02:41:35.025Z'
    get-service-status.terraform-test:
      type: get-service-status
      key: get-service-status.terraform-test
      name: terraform-test
      description: >-
        getting status for service 'terraform-test' (from module
        'terraform-test')
      completedAt: '2023-02-14T02:41:35.469Z'
      batchId: 3ae21720-63eb-4ca9-9671-d79365f34aec
      output:
        state: ready
        version: v-51c823ff3a
        outputs:
          test_password: ++IM7+a+2R8=KY-l2+j4
        detail: {}
        forwardablePorts: []
      dependencyResults: {}
      version: v-51c823ff3a
      startedAt: '2023-02-14T02:41:35.025Z'
    deploy.terraform-test:
      type: deploy
      key: deploy.terraform-test
      name: terraform-test
      description: deploying service 'terraform-test' (from module 'terraform-test')
      completedAt: '2023-02-14T02:41:35.471Z'
      batchId: 3ae21720-63eb-4ca9-9671-d79365f34aec
      output:
        state: ready
        version: v-51c823ff3a
        outputs:
          test_password: ++IM7+a+2R8=KY-l2+j4
        detail: {}
        forwardablePorts: []
      dependencyResults:
        get-service-status.terraform-test:
          type: get-service-status
          key: get-service-status.terraform-test
          name: terraform-test
          description: >-
            getting status for service 'terraform-test' (from module
            'terraform-test')
          completedAt: '2023-02-14T02:41:35.469Z'
          batchId: 3ae21720-63eb-4ca9-9671-d79365f34aec
          output:
            state: ready
            version: v-51c823ff3a
            outputs:
              test_password: ++IM7+a+2R8=KY-l2+j4
            detail: {}
            forwardablePorts: []
          dependencyResults: {}
          version: v-51c823ff3a
          startedAt: '2023-02-14T02:41:35.025Z'
        stage-build.terraform-test:
          type: stage-build
          key: stage-build.terraform-test
          name: terraform-test
          description: staging build for terraform-test
          completedAt: '2023-02-14T02:41:35.044Z'
          batchId: 3ae21720-63eb-4ca9-9671-d79365f34aec
          output: {}
          dependencyResults: {}
          version: v-585a145e21
          startedAt: '2023-02-14T02:41:35.025Z'
      version: v-51c823ff3a
      startedAt: '2023-02-14T02:41:35.470Z'
    get-service-status.terraform-two:
      type: get-service-status
      key: get-service-status.terraform-two
      name: terraform-two
      description: getting status for service 'terraform-two' (from module 'terraform-two')
      completedAt: '2023-02-14T02:41:35.916Z'
      batchId: 3ae21720-63eb-4ca9-9671-d79365f34aec
      output:
        state: outdated
        version: v-25ab304c6e
        outputs: {}
        detail: {}
        forwardablePorts: []
      dependencyResults:
        get-service-status.terraform-test:
          type: get-service-status
          key: get-service-status.terraform-test
          name: terraform-test
          description: >-
            getting status for service 'terraform-test' (from module
            'terraform-test')
          completedAt: '2023-02-14T02:41:35.469Z'
          batchId: 3ae21720-63eb-4ca9-9671-d79365f34aec
          output:
            state: ready
            version: v-51c823ff3a
            outputs:
              test_password: ++IM7+a+2R8=KY-l2+j4
            detail: {}
            forwardablePorts: []
          dependencyResults: {}
          version: v-51c823ff3a
          startedAt: '2023-02-14T02:41:35.025Z'
      version: v-25ab304c6e
      startedAt: '2023-02-14T02:41:35.471Z'
    deploy.terraform-two:
      type: deploy
      key: deploy.terraform-two
      name: terraform-two
      description: deploying service 'terraform-two' (from module 'terraform-two')
      completedAt: '2023-02-14T02:41:35.987Z'
      batchId: 3ae21720-63eb-4ca9-9671-d79365f34aec
      output:
        state: ready
        version: v-25ab304c6e
        outputs: {}
        detail: {}
        forwardablePorts: []
      dependencyResults:
        get-service-status.terraform-two:
          type: get-service-status
          key: get-service-status.terraform-two
          name: terraform-two
          description: >-
            getting status for service 'terraform-two' (from module
            'terraform-two')
          completedAt: '2023-02-14T02:41:35.916Z'
          batchId: 3ae21720-63eb-4ca9-9671-d79365f34aec
          output:
            state: outdated
            version: v-25ab304c6e
            outputs: {}
            detail: {}
            forwardablePorts: []
          dependencyResults:
            get-service-status.terraform-test:
              type: get-service-status
              key: get-service-status.terraform-test
              name: terraform-test
              description: >-
                getting status for service 'terraform-test' (from module
                'terraform-test')
              completedAt: '2023-02-14T02:41:35.469Z'
              batchId: 3ae21720-63eb-4ca9-9671-d79365f34aec
              output:
                state: ready
                version: v-51c823ff3a
                outputs:
                  test_password: ++IM7+a+2R8=KY-l2+j4
                detail: {}
                forwardablePorts: []
              dependencyResults: {}
              version: v-51c823ff3a
              startedAt: '2023-02-14T02:41:35.025Z'
          version: v-25ab304c6e
          startedAt: '2023-02-14T02:41:35.471Z'
        stage-build.terraform-two:
          type: stage-build
          key: stage-build.terraform-two
          name: terraform-two
          description: staging build for terraform-two
          completedAt: '2023-02-14T02:41:35.042Z'
          batchId: 3ae21720-63eb-4ca9-9671-d79365f34aec
          output: {}
          dependencyResults: {}
          version: v-183b32bac6
          startedAt: '2023-02-14T02:41:35.027Z'
        deploy.terraform-test:
          type: deploy
          key: deploy.terraform-test
          name: terraform-test
          description: deploying service 'terraform-test' (from module 'terraform-test')
          completedAt: '2023-02-14T02:41:35.471Z'
          batchId: 3ae21720-63eb-4ca9-9671-d79365f34aec
          output:
            state: ready
            version: v-51c823ff3a
            outputs:
              test_password: ++IM7+a+2R8=KY-l2+j4
            detail: {}
            forwardablePorts: []
          dependencyResults:
            get-service-status.terraform-test:
              type: get-service-status
              key: get-service-status.terraform-test
              name: terraform-test
              description: >-
                getting status for service 'terraform-test' (from module
                'terraform-test')
              completedAt: '2023-02-14T02:41:35.469Z'
              batchId: 3ae21720-63eb-4ca9-9671-d79365f34aec
              output:
                state: ready
                version: v-51c823ff3a
                outputs:
                  test_password: ++IM7+a+2R8=KY-l2+j4
                detail: {}
                forwardablePorts: []
              dependencyResults: {}
              version: v-51c823ff3a
              startedAt: '2023-02-14T02:41:35.025Z'
            stage-build.terraform-test:
              type: stage-build
              key: stage-build.terraform-test
              name: terraform-test
              description: staging build for terraform-test
              completedAt: '2023-02-14T02:41:35.044Z'
              batchId: 3ae21720-63eb-4ca9-9671-d79365f34aec
              output: {}
              dependencyResults: {}
              version: v-585a145e21
              startedAt: '2023-02-14T02:41:35.025Z'
          version: v-51c823ff3a
          startedAt: '2023-02-14T02:41:35.470Z'
      version: v-25ab304c6e
      startedAt: '2023-02-14T02:41:35.917Z'
restartRequired: false
```
