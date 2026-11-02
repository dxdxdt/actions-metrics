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
Updated: 2026-11-02T03:40:13.874177+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.730 |  |
| ap-east-1 | 0.532 |  |
| ap-east-2 | 0.490 |  |
| ap-northeast-1 | 0.401 |  |
| ap-northeast-2 | 0.483 |  |
| ap-northeast-3 | 0.421 |  |
| ap-south-1 | 0.683 |  |
| ap-south-2 | 0.741 |  |
| ap-southeast-1 | 0.592 |  |
| ap-southeast-2 | 0.523 |  |
| ap-southeast-3 | 0.633 |  |
| ap-southeast-4 | 0.583 |  |
| ap-southeast-5 | 0.607 |  |
| ap-southeast-6 | 0.542 |  |
| ap-southeast-7 | 0.669 |  |
| ca-central-1 | 0.118 | 18 |
| ca-west-1 | 0.143 |  |
| eu-central-1 | 0.372 |  |
| eu-central-2 | 0.392 |  |
| eu-north-1 | 0.409 |  |
| eu-south-1 | 0.380 |  |
| eu-south-2 | 0.376 |  |
| eu-west-1 | 0.307 |  |
| eu-west-2 | 0.335 |  |
| eu-west-3 | 0.342 |  |
| il-central-1 | 0.483 |  |
| me-central-1 | 0.635 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.149 |  |
| sa-east-1 | 0.481 |  |
| us-east-1 | 0.109 | 5168 |
| us-east-2 | 0.101 | 1720 |
| us-gov-east-1 | 0.100 | 1959 |
| us-gov-west-1 | 0.160 | 242 |
| us-west-1 | 0.121 | 4203 |
| us-west-2 | 0.156 | 195 |

