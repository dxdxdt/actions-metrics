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
Updated: 2026-02-27T08:33:40.744328+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.043 |  |
| ap-east-1 | 0.654 |  |
| ap-east-2 | 0.600 |  |
| ap-northeast-1 | 0.481 |  |
| ap-northeast-2 | 0.585 |  |
| ap-northeast-3 | 0.504 |  |
| ap-south-1 | 0.942 |  |
| ap-south-2 | 0.933 |  |
| ap-southeast-1 | 0.730 |  |
| ap-southeast-2 | 0.639 |  |
| ap-southeast-3 | 0.794 |  |
| ap-southeast-4 | 0.677 |  |
| ap-southeast-5 | 0.754 |  |
| ap-southeast-6 | 0.673 |  |
| ap-southeast-7 | 0.837 |  |
| ca-central-1 | 0.265 | 16 |
| ca-west-1 | 0.215 |  |
| eu-central-1 | 0.555 |  |
| eu-central-2 | 0.568 |  |
| eu-north-1 | 0.609 |  |
| eu-south-1 | 0.574 |  |
| eu-south-2 | 0.587 |  |
| eu-west-1 | 0.472 |  |
| eu-west-2 | 0.507 |  |
| eu-west-3 | 0.530 |  |
| il-central-1 | 0.730 |  |
| me-central-1 | 0.924 |  |
| me-south-1 | 0.883 |  |
| mx-central-1 | 0.230 |  |
| sa-east-1 | 0.667 |  |
| us-east-1 | 0.220 | 4193 |
| us-east-2 | 0.192 | 1381 |
| us-gov-east-1 | 0.191 | 1513 |
| us-gov-west-1 | 0.138 | 162 |
| us-west-1 | 0.128 | 3130 |
| us-west-2 | 0.139 | 133 |

