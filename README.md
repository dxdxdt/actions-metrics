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
Updated: 2026-02-13T04:13:36.584444+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.967 |  |
| ap-east-1 | 0.734 |  |
| ap-northeast-1 | 0.553 |  |
| ap-northeast-2 | 0.662 |  |
| ap-south-1 | 0.885 |  |
| ap-south-2 | 0.894 |  |
| ap-southeast-1 | 0.806 |  |
| ap-southeast-2 | 0.712 |  |
| ap-southeast-3 | 0.861 |  |
| ap-southeast-4 | 0.749 |  |
| ca-central-1 | 0.150 | 16 |
| ca-west-1 | 0.203 |  |
| eu-central-1 | 0.484 |  |
| eu-central-2 | 0.495 |  |
| eu-north-1 | 0.518 |  |
| eu-south-1 | 0.504 |  |
| eu-south-2 | 0.518 |  |
| eu-west-1 | 0.400 |  |
| eu-west-2 | 0.433 |  |
| eu-west-3 | 0.462 |  |
| il-central-1 | 0.651 |  |
| me-central-1 | 0.906 |  |
| me-south-1 | 0.859 |  |
| sa-east-1 | 0.580 |  |
| us-east-1 | 0.133 | 4113 |
| us-east-2 | 0.112 | 1335 |
| us-gov-east-1 | 0.112 | 1456 |
| us-gov-west-1 | 0.207 | 145 |
| us-west-1 | 0.198 | 3050 |
| us-west-2 | 0.209 | 125 |

