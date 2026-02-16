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
Updated: 2026-02-16T22:20:18.974082+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.929 |  |
| ap-east-1 | 0.751 |  |
| ap-east-2 | 0.689 |  |
| ap-northeast-1 | 0.572 |  |
| ap-northeast-2 | 0.701 |  |
| ap-south-1 | 0.889 |  |
| ap-south-2 | 0.936 |  |
| ap-southeast-1 | 0.834 |  |
| ap-southeast-2 | 0.759 |  |
| ap-southeast-3 | 0.890 |  |
| ap-southeast-4 | 0.803 |  |
| ap-southeast-5 | 0.873 |  |
| ap-southeast-6 | 0.832 |  |
| ap-southeast-7 | 0.954 |  |
| ca-central-1 | 0.147 | 16 |
| ca-west-1 | 0.262 |  |
| eu-central-1 | 0.431 |  |
| eu-central-2 | 0.468 |  |
| eu-north-1 | 0.492 |  |
| eu-south-1 | 0.464 |  |
| eu-south-2 | 0.473 |  |
| eu-west-1 | 0.363 |  |
| eu-west-2 | 0.404 |  |
| eu-west-3 | 0.420 |  |
| il-central-1 | 0.619 |  |
| me-central-1 | 0.820 |  |
| me-south-1 | 0.783 |  |
| mx-central-1 | 0.227 |  |
| sa-east-1 | 0.540 |  |
| us-east-1 | 0.102 | 4133 |
| us-east-2 | 0.128 | 1348 |
| us-gov-east-1 | 0.114 | 1481 |
| us-gov-west-1 | 0.275 | 150 |
| us-west-1 | 0.243 | 3066 |
| us-west-2 | 0.274 | 126 |

