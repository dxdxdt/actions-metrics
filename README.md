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
Updated: 2026-09-09T14:57:47.116995+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.071 |  |
| ap-east-1 | 0.626 |  |
| ap-east-2 | 0.565 |  |
| ap-northeast-1 | 0.449 |  |
| ap-northeast-2 | 0.530 |  |
| ap-northeast-3 | 0.476 |  |
| ap-south-1 | 0.922 |  |
| ap-south-2 | 0.875 |  |
| ap-southeast-1 | 0.731 |  |
| ap-southeast-2 | 0.611 |  |
| ap-southeast-3 | 0.766 |  |
| ap-southeast-4 | 0.656 |  |
| ap-southeast-5 | 0.726 |  |
| ap-southeast-6 | 0.639 |  |
| ap-southeast-7 | 0.812 |  |
| ca-central-1 | 0.310 | 18 |
| ca-west-1 | 0.179 |  |
| eu-central-1 | 0.583 |  |
| eu-central-2 | 0.601 |  |
| eu-north-1 | 0.635 |  |
| eu-south-1 | 0.624 |  |
| eu-south-2 | 0.629 |  |
| eu-west-1 | 0.506 |  |
| eu-west-2 | 0.541 |  |
| eu-west-3 | 0.564 |  |
| il-central-1 | 0.754 |  |
| me-central-1 | 1.010 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.259 |  |
| sa-east-1 | 0.690 |  |
| us-east-1 | 0.256 | 5093 |
| us-east-2 | 0.265 | 1685 |
| us-gov-east-1 | 0.259 | 1903 |
| us-gov-west-1 | 0.100 | 233 |
| us-west-1 | 0.107 | 4093 |
| us-west-2 | 0.100 | 192 |

