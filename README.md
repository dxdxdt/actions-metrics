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
Updated: 2026-10-17T21:55:08.258390+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.963 |  |
| ap-east-1 | 0.708 |  |
| ap-east-2 | 0.644 |  |
| ap-northeast-1 | 0.530 |  |
| ap-northeast-2 | 0.632 |  |
| ap-northeast-3 | 0.554 |  |
| ap-south-1 | 0.900 |  |
| ap-south-2 | 0.952 |  |
| ap-southeast-1 | 0.783 |  |
| ap-southeast-2 | 0.689 |  |
| ap-southeast-3 | 0.843 |  |
| ap-southeast-4 | 0.730 |  |
| ap-southeast-5 | 0.803 |  |
| ap-southeast-6 | 0.748 |  |
| ap-southeast-7 | 0.883 |  |
| ca-central-1 | 0.171 | 18 |
| ca-west-1 | 0.220 |  |
| eu-central-1 | 0.478 |  |
| eu-central-2 | 0.498 |  |
| eu-north-1 | 0.538 |  |
| eu-south-1 | 0.512 |  |
| eu-south-2 | 0.497 |  |
| eu-west-1 | 0.405 |  |
| eu-west-2 | 0.437 |  |
| eu-west-3 | 0.470 |  |
| il-central-1 | 0.651 |  |
| me-central-1 | 0.841 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.209 |  |
| sa-east-1 | 0.597 |  |
| us-east-1 | 0.137 | 5149 |
| us-east-2 | 0.133 | 1702 |
| us-gov-east-1 | 0.159 | 1947 |
| us-gov-west-1 | 0.209 | 238 |
| us-west-1 | 0.153 | 4175 |
| us-west-2 | 0.211 | 195 |

