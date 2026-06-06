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
Updated: 2026-06-06T15:07:44.236000+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.014 |  |
| ap-east-1 | 0.668 |  |
| ap-east-2 | 0.599 |  |
| ap-northeast-1 | 0.485 |  |
| ap-northeast-2 | 0.588 |  |
| ap-northeast-3 | 0.511 |  |
| ap-south-1 | 0.883 |  |
| ap-south-2 | 0.869 |  |
| ap-southeast-1 | 0.742 |  |
| ap-southeast-2 | 0.652 |  |
| ap-southeast-3 | 0.803 |  |
| ap-southeast-4 | 0.701 |  |
| ap-southeast-5 | 0.764 |  |
| ap-southeast-6 | 0.693 |  |
| ap-southeast-7 | 0.844 |  |
| ca-central-1 | 0.253 | 16 |
| ca-west-1 | 0.212 |  |
| eu-central-1 | 0.524 |  |
| eu-central-2 | 0.551 |  |
| eu-north-1 | 0.566 |  |
| eu-south-1 | 0.560 |  |
| eu-south-2 | 0.550 |  |
| eu-west-1 | 0.441 |  |
| eu-west-2 | 0.488 |  |
| eu-west-3 | 0.502 |  |
| il-central-1 | 0.676 |  |
| me-central-1 | 0.790 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.244 |  |
| sa-east-1 | 0.641 |  |
| us-east-1 | 0.193 | 4729 |
| us-east-2 | 0.205 | 1625 |
| us-gov-east-1 | 0.195 | 1709 |
| us-gov-west-1 | 0.174 | 197 |
| us-west-1 | 0.137 | 3637 |
| us-west-2 | 0.175 | 162 |

