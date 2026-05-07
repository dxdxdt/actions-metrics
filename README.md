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
Updated: 2026-05-07T13:46:30.942627+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.966 |  |
| ap-east-1 | 0.735 |  |
| ap-east-2 | 0.666 |  |
| ap-northeast-1 | 0.557 |  |
| ap-northeast-2 | 0.651 |  |
| ap-northeast-3 | 0.579 |  |
| ap-south-1 | 0.926 |  |
| ap-south-2 | 0.997 |  |
| ap-southeast-1 | 0.828 |  |
| ap-southeast-2 | 0.724 |  |
| ap-southeast-3 | 0.875 |  |
| ap-southeast-4 | 0.760 |  |
| ap-southeast-5 | 0.823 |  |
| ap-southeast-6 | 0.804 |  |
| ap-southeast-7 | 0.897 |  |
| ca-central-1 | 0.169 | 16 |
| ca-west-1 | 0.278 |  |
| eu-central-1 | 0.487 |  |
| eu-central-2 | 0.476 |  |
| eu-north-1 | 0.520 |  |
| eu-south-1 | 0.503 |  |
| eu-south-2 | 0.515 |  |
| eu-west-1 | 0.391 |  |
| eu-west-2 | 0.426 |  |
| eu-west-3 | 0.453 |  |
| il-central-1 | 0.618 |  |
| me-central-1 | 0.840 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.205 |  |
| sa-east-1 | 0.583 |  |
| us-east-1 | 0.126 | 4607 |
| us-east-2 | 0.141 | 1570 |
| us-gov-east-1 | 0.119 | 1680 |
| us-gov-west-1 | 0.237 | 194 |
| us-west-1 | 0.180 | 3537 |
| us-west-2 | 0.238 | 157 |

