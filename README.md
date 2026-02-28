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
Updated: 2026-02-28T14:16:14.655204+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.959 |  |
| ap-east-1 | 0.714 |  |
| ap-east-2 | 0.642 |  |
| ap-northeast-1 | 0.530 |  |
| ap-northeast-2 | 0.634 |  |
| ap-northeast-3 | 0.550 |  |
| ap-south-1 | 0.893 |  |
| ap-south-2 | 0.887 |  |
| ap-southeast-1 | 0.792 |  |
| ap-southeast-2 | 0.686 |  |
| ap-southeast-3 | 0.844 |  |
| ap-southeast-4 | 0.734 |  |
| ap-southeast-5 | 0.816 |  |
| ap-southeast-6 | 0.750 |  |
| ap-southeast-7 | 0.886 |  |
| ca-central-1 | 0.211 | 16 |
| ca-west-1 | 0.240 |  |
| eu-central-1 | 0.478 |  |
| eu-central-2 | 0.502 |  |
| eu-north-1 | 0.555 |  |
| eu-south-1 | 0.513 |  |
| eu-south-2 | 0.509 |  |
| eu-west-1 | 0.411 |  |
| eu-west-2 | 0.442 |  |
| eu-west-3 | 0.464 |  |
| il-central-1 | 0.646 |  |
| me-central-1 | 0.854 |  |
| me-south-1 | 0.808 |  |
| mx-central-1 | 0.229 |  |
| sa-east-1 | 0.583 |  |
| us-east-1 | 0.150 | 4199 |
| us-east-2 | 0.163 | 1383 |
| us-gov-east-1 | 0.163 | 1518 |
| us-gov-west-1 | 0.217 | 165 |
| us-west-1 | 0.162 | 3142 |
| us-west-2 | 0.218 | 133 |

