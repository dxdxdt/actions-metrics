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
Updated: 2026-06-18T19:22:30.189782+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.875 |  |
| ap-east-1 | 0.809 |  |
| ap-east-2 | 0.746 |  |
| ap-northeast-1 | 0.645 |  |
| ap-northeast-2 | 0.744 |  |
| ap-northeast-3 | 0.655 |  |
| ap-south-1 | 0.825 |  |
| ap-south-2 | 0.885 |  |
| ap-southeast-1 | 0.880 |  |
| ap-southeast-2 | 0.788 |  |
| ap-southeast-3 | 0.941 |  |
| ap-southeast-4 | 0.855 |  |
| ap-southeast-5 | 0.898 |  |
| ap-southeast-6 | 0.821 |  |
| ap-southeast-7 | 1.000 |  |
| ca-central-1 | 0.117 | 16 |
| ca-west-1 | 0.269 |  |
| eu-central-1 | 0.393 |  |
| eu-central-2 | 0.427 |  |
| eu-north-1 | 0.432 |  |
| eu-south-1 | 0.418 |  |
| eu-south-2 | 0.428 |  |
| eu-west-1 | 0.317 |  |
| eu-west-2 | 0.343 |  |
| eu-west-3 | 0.370 |  |
| il-central-1 | 0.551 |  |
| me-central-1 | 0.798 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.235 |  |
| sa-east-1 | 0.493 |  |
| us-east-1 | 0.064 | 4770 |
| us-east-2 | 0.090 | 1635 |
| us-gov-east-1 | 0.095 | 1714 |
| us-gov-west-1 | 0.303 | 198 |
| us-west-1 | 0.268 | 3677 |
| us-west-2 | 0.298 | 163 |

