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
Updated: 2026-05-23T22:44:31.526879+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.981 |  |
| ap-east-1 | 0.698 |  |
| ap-east-2 | 0.639 |  |
| ap-northeast-1 | 0.521 |  |
| ap-northeast-2 | 0.625 |  |
| ap-northeast-3 | 0.547 |  |
| ap-south-1 | 0.917 |  |
| ap-south-2 | 0.911 |  |
| ap-southeast-1 | 0.772 |  |
| ap-southeast-2 | 0.685 |  |
| ap-southeast-3 | 0.833 |  |
| ap-southeast-4 | 0.725 |  |
| ap-southeast-5 | 0.797 |  |
| ap-southeast-6 | 0.708 |  |
| ap-southeast-7 | 0.883 |  |
| ca-central-1 | 0.189 | 16 |
| ca-west-1 | 0.246 |  |
| eu-central-1 | 0.488 |  |
| eu-central-2 | 0.515 |  |
| eu-north-1 | 0.529 |  |
| eu-south-1 | 0.519 |  |
| eu-south-2 | 0.529 |  |
| eu-west-1 | 0.407 |  |
| eu-west-2 | 0.453 |  |
| eu-west-3 | 0.479 |  |
| il-central-1 | 0.662 |  |
| me-central-1 | 0.869 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.196 |  |
| sa-east-1 | 0.615 |  |
| us-east-1 | 0.162 | 4681 |
| us-east-2 | 0.115 | 1608 |
| us-gov-east-1 | 0.124 | 1704 |
| us-gov-west-1 | 0.195 | 195 |
| us-west-1 | 0.147 | 3592 |
| us-west-2 | 0.194 | 159 |

