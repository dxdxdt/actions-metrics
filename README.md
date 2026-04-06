# Github Actions Metrics
Information on Github hosted runners like the Azure region they run on is
necessary info when optimising CD/CI pipelines(especially network latencies and
route path bandwidth). Github does not disclose it so I did it myself.

Using this info, place the resources(DB, object storage, other instances) near
the runners are usually run.

A few pieces of info I could gather online:

- Azure doesn't provide a list of VM service endpoints like AWS
- Github-hosted Actions runners are actually Azure VMs (surprisingly, not in a
  container)
- Github is hosted in the data centre somewhere in the US, probably in the same
  data centre where Azure is present

Microsoft definitely has more points of presence than any other cloud service
providers, but there's no official list of data center endpoints to ping. If you
look at the map,

<a href="https://aws.amazon.com/about-aws/global-infrastructure/regions_az/">
<img src="image.png" style="width: 500px;">
</a>
<a href="https://datacenters.microsoft.com/globe/explore">
<img src="image-1.png" style="width: 500px;">
</a>

they're close enough. For most devs, all that matters is probably how close
their S3 buckets are to the Github Actions runners. Some AWS and Azure regions
are under the same roof, but then again, no official data.

## DATA
Updated: 2026-04-06T22:29:01.126706+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.882 |  |
| ap-east-1 | 0.800 |  |
| ap-east-2 | 0.726 |  |
| ap-northeast-1 | 0.619 |  |
| ap-northeast-2 | 0.728 |  |
| ap-northeast-3 | 0.635 |  |
| ap-south-1 | 0.844 |  |
| ap-south-2 | 0.883 |  |
| ap-southeast-1 | 0.871 |  |
| ap-southeast-2 | 0.803 |  |
| ap-southeast-3 | 0.929 |  |
| ap-southeast-4 | 0.826 |  |
| ap-southeast-5 | 0.899 |  |
| ap-southeast-6 | 0.823 |  |
| ap-southeast-7 | 0.988 |  |
| ca-central-1 | 0.108 | 16 |
| ca-west-1 | 0.275 |  |
| eu-central-1 | 0.394 |  |
| eu-central-2 | 0.421 |  |
| eu-north-1 | 0.464 |  |
| eu-south-1 | 0.437 |  |
| eu-south-2 | 0.431 |  |
| eu-west-1 | 0.327 |  |
| eu-west-2 | 0.358 |  |
| eu-west-3 | 0.374 |  |
| il-central-1 | 0.583 |  |
| me-central-1 | 0.776 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.239 |  |
| sa-east-1 | 0.499 |  |
| us-east-1 | 0.064 | 4451 |
| us-east-2 | 0.092 | 1487 |
| us-gov-east-1 | 0.088 | 1631 |
| us-gov-west-1 | 0.312 | 191 |
| us-west-1 | 0.260 | 3365 |
| us-west-2 | 0.301 | 154 |

