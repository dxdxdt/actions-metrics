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
Updated: 2026-03-14T08:27:03.230206+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.079 |  |
| ap-east-1 | 0.623 |  |
| ap-east-2 | 0.566 |  |
| ap-northeast-1 | 0.445 |  |
| ap-northeast-2 | 0.556 |  |
| ap-northeast-3 | 0.471 |  |
| ap-south-1 | 0.901 |  |
| ap-south-2 | 0.865 |  |
| ap-southeast-1 | 0.703 |  |
| ap-southeast-2 | 0.579 |  |
| ap-southeast-3 | 0.756 |  |
| ap-southeast-4 | 0.619 |  |
| ap-southeast-5 | 0.718 |  |
| ap-southeast-6 | 0.615 |  |
| ap-southeast-7 | 0.803 |  |
| ca-central-1 | 0.311 | 16 |
| ca-west-1 | 0.169 |  |
| eu-central-1 | 0.599 |  |
| eu-central-2 | 0.613 |  |
| eu-north-1 | 0.653 |  |
| eu-south-1 | 0.631 |  |
| eu-south-2 | 0.633 |  |
| eu-west-1 | 0.532 |  |
| eu-west-2 | 0.562 |  |
| eu-west-3 | 0.579 |  |
| il-central-1 | 0.778 |  |
| me-central-1 | 1.000 |  |
| me-south-1 | 0.934 |  |
| mx-central-1 | 0.241 |  |
| sa-east-1 | 0.701 |  |
| us-east-1 | 0.259 | 4278 |
| us-east-2 | 0.239 | 1422 |
| us-gov-east-1 | 0.241 | 1573 |
| us-gov-west-1 | 0.108 | 183 |
| us-west-1 | 0.055 | 3225 |
| us-west-2 | 0.111 | 146 |

