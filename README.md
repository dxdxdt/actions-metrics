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
Updated: 2026-08-08T11:21:39.773460+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.974 |  |
| ap-east-1 | 0.693 |  |
| ap-east-2 | 0.636 |  |
| ap-northeast-1 | 0.515 |  |
| ap-northeast-2 | 0.625 |  |
| ap-northeast-3 | 0.541 |  |
| ap-south-1 | 0.895 |  |
| ap-south-2 | 0.916 |  |
| ap-southeast-1 | 0.769 |  |
| ap-southeast-2 | 0.664 |  |
| ap-southeast-3 | 0.828 |  |
| ap-southeast-4 | 0.707 |  |
| ap-southeast-5 | 0.790 |  |
| ap-southeast-6 | 0.719 |  |
| ap-southeast-7 | 0.875 |  |
| ca-central-1 | 0.197 | 18 |
| ca-west-1 | 0.208 |  |
| eu-central-1 | 0.488 |  |
| eu-central-2 | 0.515 |  |
| eu-north-1 | 0.535 |  |
| eu-south-1 | 0.526 |  |
| eu-south-2 | 0.524 |  |
| eu-west-1 | 0.428 |  |
| eu-west-2 | 0.448 |  |
| eu-west-3 | 0.473 |  |
| il-central-1 | 0.665 |  |
| me-central-1 | 0.895 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.229 |  |
| sa-east-1 | 0.618 |  |
| us-east-1 | 0.159 | 4957 |
| us-east-2 | 0.151 | 1676 |
| us-gov-east-1 | 0.142 | 1809 |
| us-gov-west-1 | 0.189 | 213 |
| us-west-1 | 0.133 | 3899 |
| us-west-2 | 0.188 | 173 |

