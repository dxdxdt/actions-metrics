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
Updated: 2026-07-09T17:14:03.108972+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.889 |  |
| ap-east-1 | 0.790 |  |
| ap-east-2 | 0.736 |  |
| ap-northeast-1 | 0.623 |  |
| ap-northeast-2 | 0.729 |  |
| ap-northeast-3 | 0.651 |  |
| ap-south-1 | 0.837 |  |
| ap-south-2 | 0.893 |  |
| ap-southeast-1 | 0.875 |  |
| ap-southeast-2 | 0.762 |  |
| ap-southeast-3 | 0.927 |  |
| ap-southeast-4 | 0.810 |  |
| ap-southeast-5 | 0.885 |  |
| ap-southeast-6 | 0.803 |  |
| ap-southeast-7 | 0.976 |  |
| ca-central-1 | 0.134 | 16 |
| ca-west-1 | 0.311 |  |
| eu-central-1 | 0.404 |  |
| eu-central-2 | 0.431 |  |
| eu-north-1 | 0.467 |  |
| eu-south-1 | 0.440 |  |
| eu-south-2 | 0.440 |  |
| eu-west-1 | 0.330 |  |
| eu-west-2 | 0.366 |  |
| eu-west-3 | 0.384 |  |
| il-central-1 | 0.566 |  |
| me-central-1 | 0.806 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.245 |  |
| sa-east-1 | 0.508 |  |
| us-east-1 | 0.077 | 4840 |
| us-east-2 | 0.095 | 1656 |
| us-gov-east-1 | 0.117 | 1733 |
| us-gov-west-1 | 0.294 | 201 |
| us-west-1 | 0.247 | 3759 |
| us-west-2 | 0.296 | 164 |

