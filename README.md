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
Updated: 2026-07-06T22:08:46.102137+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.006 |  |
| ap-east-1 | 0.677 |  |
| ap-east-2 | 0.613 |  |
| ap-northeast-1 | 0.497 |  |
| ap-northeast-2 | 0.597 |  |
| ap-northeast-3 | 0.523 |  |
| ap-south-1 | 0.907 |  |
| ap-south-2 | 0.895 |  |
| ap-southeast-1 | 0.755 |  |
| ap-southeast-2 | 0.649 |  |
| ap-southeast-3 | 0.817 |  |
| ap-southeast-4 | 0.693 |  |
| ap-southeast-5 | 0.777 |  |
| ap-southeast-6 | 0.684 |  |
| ap-southeast-7 | 0.861 |  |
| ca-central-1 | 0.226 | 16 |
| ca-west-1 | 0.211 |  |
| eu-central-1 | 0.518 |  |
| eu-central-2 | 0.540 |  |
| eu-north-1 | 0.587 |  |
| eu-south-1 | 0.568 |  |
| eu-south-2 | 0.552 |  |
| eu-west-1 | 0.471 |  |
| eu-west-2 | 0.491 |  |
| eu-west-3 | 0.508 |  |
| il-central-1 | 0.699 |  |
| me-central-1 | 0.945 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.203 |  |
| sa-east-1 | 0.626 |  |
| us-east-1 | 0.183 | 4828 |
| us-east-2 | 0.193 | 1655 |
| us-gov-east-1 | 0.172 | 1729 |
| us-gov-west-1 | 0.182 | 201 |
| us-west-1 | 0.120 | 3750 |
| us-west-2 | 0.186 | 164 |

