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
Updated: 2026-08-11T20:36:23.579542+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.069 |  |
| ap-east-1 | 0.621 |  |
| ap-east-2 | 0.557 |  |
| ap-northeast-1 | 0.441 |  |
| ap-northeast-2 | 0.544 |  |
| ap-northeast-3 | 0.468 |  |
| ap-south-1 | 0.916 |  |
| ap-south-2 | 0.871 |  |
| ap-southeast-1 | 0.705 |  |
| ap-southeast-2 | 0.609 |  |
| ap-southeast-3 | 0.763 |  |
| ap-southeast-4 | 0.653 |  |
| ap-southeast-5 | 0.724 |  |
| ap-southeast-6 | 0.644 |  |
| ap-southeast-7 | 0.811 |  |
| ca-central-1 | 0.307 | 18 |
| ca-west-1 | 0.213 |  |
| eu-central-1 | 0.573 |  |
| eu-central-2 | 0.606 |  |
| eu-north-1 | 0.650 |  |
| eu-south-1 | 0.613 |  |
| eu-south-2 | 0.603 |  |
| eu-west-1 | 0.497 |  |
| eu-west-2 | 0.536 |  |
| eu-west-3 | 0.548 |  |
| il-central-1 | 0.729 |  |
| me-central-1 | 0.978 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.220 |  |
| sa-east-1 | 0.693 |  |
| us-east-1 | 0.239 | 4975 |
| us-east-2 | 0.289 | 1679 |
| us-gov-east-1 | 0.264 | 1822 |
| us-gov-west-1 | 0.122 | 218 |
| us-west-1 | 0.095 | 3926 |
| us-west-2 | 0.123 | 176 |

