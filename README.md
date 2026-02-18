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
Updated: 2026-02-18T08:36:46.723377+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.936 |  |
| ap-east-1 | 0.742 |  |
| ap-east-2 | 0.681 |  |
| ap-northeast-1 | 0.560 |  |
| ap-northeast-2 | 0.669 |  |
| ap-northeast-3 | 0.593 |  |
| ap-south-1 | 0.847 |  |
| ap-south-2 | 0.889 |  |
| ap-southeast-1 | 0.819 |  |
| ap-southeast-2 | 0.703 |  |
| ap-southeast-3 | 0.875 |  |
| ap-southeast-4 | 0.752 |  |
| ap-southeast-5 | 0.841 |  |
| ap-southeast-6 | 0.738 |  |
| ap-southeast-7 | 0.926 |  |
| ca-central-1 | 0.151 | 16 |
| ca-west-1 | 0.222 |  |
| eu-central-1 | 0.460 |  |
| eu-central-2 | 0.476 |  |
| eu-north-1 | 0.511 |  |
| eu-south-1 | 0.489 |  |
| eu-south-2 | 0.488 |  |
| eu-west-1 | 0.379 |  |
| eu-west-2 | 0.408 |  |
| eu-west-3 | 0.445 |  |
| il-central-1 | 0.641 |  |
| me-central-1 | 0.847 |  |
| me-south-1 | 0.806 |  |
| mx-central-1 | 0.227 |  |
| sa-east-1 | 0.562 |  |
| us-east-1 | 0.109 | 4138 |
| us-east-2 | 0.104 | 1354 |
| us-gov-east-1 | 0.108 | 1487 |
| us-gov-west-1 | 0.228 | 153 |
| us-west-1 | 0.768 | 3073 |
| us-west-2 | 0.229 | 126 |

