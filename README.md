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
Updated: 2026-02-09T22:28:43.490907+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.966 |  |
| ap-east-1 | 0.734 |  |
| ap-northeast-1 | 0.551 |  |
| ap-northeast-2 | 0.649 |  |
| ap-south-1 | 0.895 |  |
| ap-south-2 | 0.936 |  |
| ap-southeast-1 | 0.801 |  |
| ap-southeast-2 | 0.712 |  |
| ap-southeast-3 | 0.865 |  |
| ap-southeast-4 | 0.755 |  |
| ca-central-1 | 0.135 | 16 |
| ca-west-1 | 0.204 |  |
| eu-central-1 | 0.473 |  |
| eu-central-2 | 0.486 |  |
| eu-north-1 | 0.517 |  |
| eu-south-1 | 0.506 |  |
| eu-south-2 | 0.508 |  |
| eu-west-1 | 0.392 |  |
| eu-west-2 | 0.428 |  |
| eu-west-3 | 0.460 |  |
| il-central-1 | 0.633 |  |
| me-central-1 | 0.845 |  |
| me-south-1 | 0.815 |  |
| sa-east-1 | 0.572 |  |
| us-east-1 | 0.114 | 4093 |
| us-east-2 | 0.091 | 1328 |
| us-gov-east-1 | 0.091 | 1446 |
| us-gov-west-1 | 0.203 | 142 |
| us-west-1 | 0.215 | 3031 |
| us-west-2 | 0.202 | 125 |

