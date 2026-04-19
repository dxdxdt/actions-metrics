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
Updated: 2026-04-19T10:32:59.596558+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.990 |  |
| ap-east-1 | 0.714 |  |
| ap-east-2 | 0.655 |  |
| ap-northeast-1 | 0.549 |  |
| ap-northeast-2 | 0.643 |  |
| ap-northeast-3 | 0.565 |  |
| ap-south-1 | 0.881 |  |
| ap-south-2 | 0.910 |  |
| ap-southeast-1 | 0.801 |  |
| ap-southeast-2 | 0.693 |  |
| ap-southeast-3 | 0.856 |  |
| ap-southeast-4 | 0.731 |  |
| ap-southeast-5 | 0.809 |  |
| ap-southeast-6 | 0.728 |  |
| ap-southeast-7 | 0.897 |  |
| ca-central-1 | 0.185 | 16 |
| ca-west-1 | 0.218 |  |
| eu-central-1 | 0.491 |  |
| eu-central-2 | 0.512 |  |
| eu-north-1 | 0.545 |  |
| eu-south-1 | 0.512 |  |
| eu-south-2 | 0.527 |  |
| eu-west-1 | 0.425 |  |
| eu-west-2 | 0.448 |  |
| eu-west-3 | 0.481 |  |
| il-central-1 | 0.666 |  |
| me-central-1 | 0.865 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.224 |  |
| sa-east-1 | 0.599 |  |
| us-east-1 | 0.142 | 4525 |
| us-east-2 | 0.118 | 1514 |
| us-gov-east-1 | 0.125 | 1656 |
| us-gov-west-1 | 0.208 | 194 |
| us-west-1 | 0.162 | 3440 |
| us-west-2 | 0.213 | 156 |

