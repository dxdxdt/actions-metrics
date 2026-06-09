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
Updated: 2026-06-09T23:14:02.574667+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.889 |  |
| ap-east-1 | 0.795 |  |
| ap-east-2 | 0.742 |  |
| ap-northeast-1 | 0.625 |  |
| ap-northeast-2 | 0.730 |  |
| ap-northeast-3 | 0.641 |  |
| ap-south-1 | 0.864 |  |
| ap-south-2 | 0.895 |  |
| ap-southeast-1 | 0.867 |  |
| ap-southeast-2 | 0.762 |  |
| ap-southeast-3 | 0.929 |  |
| ap-southeast-4 | 0.816 |  |
| ap-southeast-5 | 0.887 |  |
| ap-southeast-6 | 0.798 |  |
| ap-southeast-7 | 0.983 |  |
| ca-central-1 | 0.117 | 16 |
| ca-west-1 | 0.295 |  |
| eu-central-1 | 0.401 |  |
| eu-central-2 | 0.430 |  |
| eu-north-1 | 0.451 |  |
| eu-south-1 | 0.440 |  |
| eu-south-2 | 0.433 |  |
| eu-west-1 | 0.326 |  |
| eu-west-2 | 0.362 |  |
| eu-west-3 | 0.383 |  |
| il-central-1 | 0.561 |  |
| me-central-1 | 0.806 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.237 |  |
| sa-east-1 | 0.507 |  |
| us-east-1 | 0.076 | 4737 |
| us-east-2 | 0.087 | 1630 |
| us-gov-east-1 | 0.107 | 1710 |
| us-gov-west-1 | 0.294 | 198 |
| us-west-1 | 0.235 | 3653 |
| us-west-2 | 0.290 | 162 |

