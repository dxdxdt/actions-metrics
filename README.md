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
Updated: 2026-04-29T20:55:46.482892+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.994 |  |
| ap-east-1 | 0.705 |  |
| ap-east-2 | 0.636 |  |
| ap-northeast-1 | 0.521 |  |
| ap-northeast-2 | 0.622 |  |
| ap-northeast-3 | 0.548 |  |
| ap-south-1 | 0.879 |  |
| ap-south-2 | 0.899 |  |
| ap-southeast-1 | 0.777 |  |
| ap-southeast-2 | 0.692 |  |
| ap-southeast-3 | 0.833 |  |
| ap-southeast-4 | 0.736 |  |
| ap-southeast-5 | 0.802 |  |
| ap-southeast-6 | 0.728 |  |
| ap-southeast-7 | 0.884 |  |
| ca-central-1 | 0.221 | 16 |
| ca-west-1 | 0.248 |  |
| eu-central-1 | 0.501 |  |
| eu-central-2 | 0.508 |  |
| eu-north-1 | 0.548 |  |
| eu-south-1 | 0.513 |  |
| eu-south-2 | 0.522 |  |
| eu-west-1 | 0.440 |  |
| eu-west-2 | 0.448 |  |
| eu-west-3 | 0.469 |  |
| il-central-1 | 0.660 |  |
| me-central-1 | 0.864 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.225 |  |
| sa-east-1 | 0.607 |  |
| us-east-1 | 0.157 | 4576 |
| us-east-2 | 0.169 | 1546 |
| us-gov-east-1 | 0.157 | 1667 |
| us-gov-west-1 | 0.213 | 194 |
| us-west-1 | 0.153 | 3501 |
| us-west-2 | 0.213 | 157 |

