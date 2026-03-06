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
Updated: 2026-03-06T12:37:13.838264+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.951 |  |
| ap-east-1 | 0.728 |  |
| ap-east-2 | 0.662 |  |
| ap-northeast-1 | 0.551 |  |
| ap-northeast-2 | 0.664 |  |
| ap-northeast-3 | 0.567 |  |
| ap-south-1 | 0.886 |  |
| ap-south-2 | 0.887 |  |
| ap-southeast-1 | 0.812 |  |
| ap-southeast-2 | 0.693 |  |
| ap-southeast-3 | 0.863 |  |
| ap-southeast-4 | 0.731 |  |
| ap-southeast-5 | 0.834 |  |
| ap-southeast-6 | 0.792 |  |
| ap-southeast-7 | 0.925 |  |
| ca-central-1 | 0.197 | 16 |
| ca-west-1 | 0.251 |  |
| eu-central-1 | 0.468 |  |
| eu-central-2 | 0.498 |  |
| eu-north-1 | 0.530 |  |
| eu-south-1 | 0.506 |  |
| eu-south-2 | 0.504 |  |
| eu-west-1 | 0.403 |  |
| eu-west-2 | 0.433 |  |
| eu-west-3 | 0.451 |  |
| il-central-1 | 0.643 |  |
| me-central-1 | 0.855 |  |
| me-south-1 | 0.816 |  |
| mx-central-1 | 0.274 |  |
| sa-east-1 | 0.583 |  |
| us-east-1 | 0.143 | 4230 |
| us-east-2 | 0.167 | 1402 |
| us-gov-east-1 | 0.160 | 1532 |
| us-gov-west-1 | 0.233 | 173 |
| us-west-1 | 0.166 | 3184 |
| us-west-2 | 0.239 | 141 |

