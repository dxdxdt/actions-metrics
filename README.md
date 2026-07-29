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
Updated: 2026-07-29T17:06:37.766772+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.928 |  |
| ap-east-1 | 0.750 |  |
| ap-east-2 | 0.693 |  |
| ap-northeast-1 | 0.572 |  |
| ap-northeast-2 | 0.678 |  |
| ap-northeast-3 | 0.599 |  |
| ap-south-1 | 0.883 |  |
| ap-south-2 | 0.990 |  |
| ap-southeast-1 | 0.826 |  |
| ap-southeast-2 | 0.730 |  |
| ap-southeast-3 | 0.875 |  |
| ap-southeast-4 | 0.770 |  |
| ap-southeast-5 | 0.845 |  |
| ap-southeast-6 | 0.758 |  |
| ap-southeast-7 | 0.930 |  |
| ca-central-1 | 0.167 | 17 |
| ca-west-1 | 0.230 |  |
| eu-central-1 | 0.438 |  |
| eu-central-2 | 0.471 |  |
| eu-north-1 | 0.484 |  |
| eu-south-1 | 0.461 |  |
| eu-south-2 | 0.486 |  |
| eu-west-1 | 0.368 |  |
| eu-west-2 | 0.408 |  |
| eu-west-3 | 0.431 |  |
| il-central-1 | 0.592 |  |
| me-central-1 | 0.827 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.207 |  |
| sa-east-1 | 0.557 |  |
| us-east-1 | 0.102 | 4920 |
| us-east-2 | 0.086 | 1670 |
| us-gov-east-1 | 0.082 | 1784 |
| us-gov-west-1 | 0.247 | 207 |
| us-west-1 | 0.193 | 3853 |
| us-west-2 | 0.246 | 171 |

