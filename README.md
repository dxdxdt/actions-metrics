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
Updated: 2026-07-21T23:51:21.640928+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.984 |  |
| ap-east-1 | 0.700 |  |
| ap-east-2 | 0.640 |  |
| ap-northeast-1 | 0.522 |  |
| ap-northeast-2 | 0.627 |  |
| ap-northeast-3 | 0.550 |  |
| ap-south-1 | 0.903 |  |
| ap-south-2 | 0.909 |  |
| ap-southeast-1 | 0.780 |  |
| ap-southeast-2 | 0.685 |  |
| ap-southeast-3 | 0.841 |  |
| ap-southeast-4 | 0.729 |  |
| ap-southeast-5 | 0.797 |  |
| ap-southeast-6 | 0.724 |  |
| ap-southeast-7 | 0.884 |  |
| ca-central-1 | 0.217 | 16 |
| ca-west-1 | 0.246 |  |
| eu-central-1 | 0.498 |  |
| eu-central-2 | 0.514 |  |
| eu-north-1 | 0.555 |  |
| eu-south-1 | 0.528 |  |
| eu-south-2 | 0.525 |  |
| eu-west-1 | 0.422 |  |
| eu-west-2 | 0.447 |  |
| eu-west-3 | 0.472 |  |
| il-central-1 | 0.649 |  |
| me-central-1 | 0.891 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.202 |  |
| sa-east-1 | 0.593 |  |
| us-east-1 | 0.153 | 4896 |
| us-east-2 | 0.185 | 1659 |
| us-gov-east-1 | 0.190 | 1772 |
| us-gov-west-1 | 0.214 | 206 |
| us-west-1 | 0.158 | 3816 |
| us-west-2 | 0.216 | 167 |

