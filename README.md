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
Updated: 2026-07-11T23:45:44.572198+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.897 |  |
| ap-east-1 | 0.798 |  |
| ap-east-2 | 0.740 |  |
| ap-northeast-1 | 0.621 |  |
| ap-northeast-2 | 0.725 |  |
| ap-northeast-3 | 0.647 |  |
| ap-south-1 | 0.831 |  |
| ap-south-2 | 0.870 |  |
| ap-southeast-1 | 0.873 |  |
| ap-southeast-2 | 0.744 |  |
| ap-southeast-3 | 0.929 |  |
| ap-southeast-4 | 0.794 |  |
| ap-southeast-5 | 0.891 |  |
| ap-southeast-6 | 0.780 |  |
| ap-southeast-7 | 0.978 |  |
| ca-central-1 | 0.133 | 16 |
| ca-west-1 | 0.260 |  |
| eu-central-1 | 0.413 |  |
| eu-central-2 | 0.442 |  |
| eu-north-1 | 0.473 |  |
| eu-south-1 | 0.456 |  |
| eu-south-2 | 0.456 |  |
| eu-west-1 | 0.344 |  |
| eu-west-2 | 0.379 |  |
| eu-west-3 | 0.397 |  |
| il-central-1 | 0.575 |  |
| me-central-1 | 0.807 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.238 |  |
| sa-east-1 | 0.521 |  |
| us-east-1 | 0.082 | 4852 |
| us-east-2 | 0.103 | 1656 |
| us-gov-east-1 | 0.107 | 1739 |
| us-gov-west-1 | 0.277 | 202 |
| us-west-1 | 0.218 | 3769 |
| us-west-2 | 0.279 | 165 |

