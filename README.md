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
Updated: 2026-02-14T01:19:19.999163+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.031 |  |
| ap-east-1 | 0.666 |  |
| ap-east-2 | 0.597 |  |
| ap-northeast-1 | 0.483 |  |
| ap-northeast-2 | 0.591 |  |
| ap-south-1 | 0.905 |  |
| ap-south-2 | 0.882 |  |
| ap-southeast-1 | 0.736 |  |
| ap-southeast-2 | 0.635 |  |
| ap-southeast-3 | 0.798 |  |
| ap-southeast-4 | 0.675 |  |
| ap-southeast-5 | 0.754 |  |
| ap-southeast-6 | 0.675 |  |
| ap-southeast-7 | 0.843 |  |
| ca-central-1 | 0.252 | 16 |
| ca-west-1 | 0.229 |  |
| eu-central-1 | 0.536 |  |
| eu-central-2 | 0.558 |  |
| eu-north-1 | 0.589 |  |
| eu-south-1 | 0.570 |  |
| eu-south-2 | 0.571 |  |
| eu-west-1 | 0.465 |  |
| eu-west-2 | 0.506 |  |
| eu-west-3 | 0.515 |  |
| il-central-1 | 0.724 |  |
| me-central-1 | 0.917 |  |
| me-south-1 | 0.880 |  |
| mx-central-1 | 0.251 |  |
| sa-east-1 | 0.641 |  |
| us-east-1 | 0.201 | 4118 |
| us-east-2 | 0.189 | 1339 |
| us-gov-east-1 | 0.189 | 1459 |
| us-gov-west-1 | 0.160 | 147 |
| us-west-1 | 0.116 | 3056 |
| us-west-2 | 0.161 | 125 |

