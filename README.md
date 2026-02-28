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
Updated: 2026-02-28T08:20:42.269483+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.011 |  |
| ap-east-1 | 0.675 |  |
| ap-east-2 | 0.611 |  |
| ap-northeast-1 | 0.500 |  |
| ap-northeast-2 | 0.605 |  |
| ap-northeast-3 | 0.522 |  |
| ap-south-1 | 0.931 |  |
| ap-south-2 | 0.934 |  |
| ap-southeast-1 | 0.752 |  |
| ap-southeast-2 | 0.651 |  |
| ap-southeast-3 | 0.804 |  |
| ap-southeast-4 | 0.693 |  |
| ap-southeast-5 | 0.768 |  |
| ap-southeast-6 | 0.730 |  |
| ap-southeast-7 | 0.851 |  |
| ca-central-1 | 0.226 | 16 |
| ca-west-1 | 0.227 |  |
| eu-central-1 | 0.520 |  |
| eu-central-2 | 0.545 |  |
| eu-north-1 | 0.579 |  |
| eu-south-1 | 0.558 |  |
| eu-south-2 | 0.560 |  |
| eu-west-1 | 0.441 |  |
| eu-west-2 | 0.481 |  |
| eu-west-3 | 0.495 |  |
| il-central-1 | 0.690 |  |
| me-central-1 | 0.897 |  |
| me-south-1 | 0.858 |  |
| mx-central-1 | 0.213 |  |
| sa-east-1 | 0.629 |  |
| us-east-1 | 0.186 | 4197 |
| us-east-2 | 0.194 | 1382 |
| us-gov-east-1 | 0.167 | 1518 |
| us-gov-west-1 | 0.155 | 165 |
| us-west-1 | 0.146 | 3139 |
| us-west-2 | 0.164 | 133 |

