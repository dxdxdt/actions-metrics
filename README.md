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
Updated: 2026-02-22T18:25:19.570429+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.988 |  |
| ap-east-1 | 0.701 |  |
| ap-east-2 | 0.635 |  |
| ap-northeast-1 | 0.517 |  |
| ap-northeast-2 | 0.623 |  |
| ap-northeast-3 | 0.543 |  |
| ap-south-1 | 0.872 |  |
| ap-south-2 | 0.857 |  |
| ap-southeast-1 | 0.778 |  |
| ap-southeast-2 | 0.671 |  |
| ap-southeast-3 | 0.826 |  |
| ap-southeast-4 | 0.719 |  |
| ap-southeast-5 | 0.798 |  |
| ap-southeast-6 | 0.708 |  |
| ap-southeast-7 | 0.883 |  |
| ca-central-1 | 0.232 | 16 |
| ca-west-1 | 0.220 |  |
| eu-central-1 | 0.502 |  |
| eu-central-2 | 0.538 |  |
| eu-north-1 | 0.552 |  |
| eu-south-1 | 0.531 |  |
| eu-south-2 | 0.546 |  |
| eu-west-1 | 0.431 |  |
| eu-west-2 | 0.462 |  |
| eu-west-3 | 0.497 |  |
| il-central-1 | 0.689 |  |
| me-central-1 | 0.887 |  |
| me-south-1 | 0.845 |  |
| mx-central-1 | 0.243 |  |
| sa-east-1 | 0.619 |  |
| us-east-1 | 0.172 | 4163 |
| us-east-2 | 0.171 | 1371 |
| us-gov-east-1 | 0.172 | 1500 |
| us-gov-west-1 | 0.198 | 160 |
| us-west-1 | 0.146 | 3099 |
| us-west-2 | 0.204 | 130 |

