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
Updated: 2026-08-15T23:12:59.212628+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.010 |  |
| ap-east-1 | 0.666 |  |
| ap-east-2 | 0.599 |  |
| ap-northeast-1 | 0.481 |  |
| ap-northeast-2 | 0.579 |  |
| ap-northeast-3 | 0.514 |  |
| ap-south-1 | 0.865 |  |
| ap-south-2 | 0.859 |  |
| ap-southeast-1 | 0.744 |  |
| ap-southeast-2 | 0.657 |  |
| ap-southeast-3 | 0.795 |  |
| ap-southeast-4 | 0.705 |  |
| ap-southeast-5 | 0.759 |  |
| ap-southeast-6 | 0.693 |  |
| ap-southeast-7 | 0.847 |  |
| ca-central-1 | 0.261 | 18 |
| ca-west-1 | 0.189 |  |
| eu-central-1 | 0.522 |  |
| eu-central-2 | 0.551 |  |
| eu-north-1 | 0.570 |  |
| eu-south-1 | 0.556 |  |
| eu-south-2 | 0.559 |  |
| eu-west-1 | 0.451 |  |
| eu-west-2 | 0.484 |  |
| eu-west-3 | 0.513 |  |
| il-central-1 | 0.708 |  |
| me-central-1 | 0.904 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.252 |  |
| sa-east-1 | 0.655 |  |
| us-east-1 | 0.200 | 5004 |
| us-east-2 | 0.211 | 1679 |
| us-gov-east-1 | 0.203 | 1831 |
| us-gov-west-1 | 0.157 | 223 |
| us-west-1 | 0.150 | 3960 |
| us-west-2 | 0.158 | 178 |

