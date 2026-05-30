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
Updated: 2026-05-30T02:26:36.712983+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.028 |  |
| ap-east-1 | 0.674 |  |
| ap-east-2 | 0.615 |  |
| ap-northeast-1 | 0.497 |  |
| ap-northeast-2 | 0.606 |  |
| ap-northeast-3 | 0.523 |  |
| ap-south-1 | 0.901 |  |
| ap-south-2 | 0.888 |  |
| ap-southeast-1 | 0.756 |  |
| ap-southeast-2 | 0.641 |  |
| ap-southeast-3 | 0.806 |  |
| ap-southeast-4 | 0.685 |  |
| ap-southeast-5 | 0.773 |  |
| ap-southeast-6 | 0.687 |  |
| ap-southeast-7 | 0.852 |  |
| ca-central-1 | 0.249 | 16 |
| ca-west-1 | 0.280 |  |
| eu-central-1 | 0.546 |  |
| eu-central-2 | 0.558 |  |
| eu-north-1 | 0.582 |  |
| eu-south-1 | 0.567 |  |
| eu-south-2 | 0.568 |  |
| eu-west-1 | 0.467 |  |
| eu-west-2 | 0.498 |  |
| eu-west-3 | 0.522 |  |
| il-central-1 | 0.684 |  |
| me-central-1 | 0.993 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.241 |  |
| sa-east-1 | 0.654 |  |
| us-east-1 | 0.214 | 4699 |
| us-east-2 | 0.171 | 1614 |
| us-gov-east-1 | 0.189 | 1708 |
| us-gov-west-1 | 0.163 | 195 |
| us-west-1 | 0.106 | 3617 |
| us-west-2 | 0.167 | 161 |

