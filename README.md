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
Updated: 2026-07-22T21:59:31.345052+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.893 |  |
| ap-east-1 | 0.796 |  |
| ap-east-2 | 0.750 |  |
| ap-northeast-1 | 0.617 |  |
| ap-northeast-2 | 0.728 |  |
| ap-northeast-3 | 0.642 |  |
| ap-south-1 | 0.854 |  |
| ap-south-2 | 0.950 |  |
| ap-southeast-1 | 0.871 |  |
| ap-southeast-2 | 0.770 |  |
| ap-southeast-3 | 0.921 |  |
| ap-southeast-4 | 0.815 |  |
| ap-southeast-5 | 0.891 |  |
| ap-southeast-6 | 0.805 |  |
| ap-southeast-7 | 0.975 |  |
| ca-central-1 | 0.117 | 16 |
| ca-west-1 | 0.254 |  |
| eu-central-1 | 0.402 |  |
| eu-central-2 | 0.418 |  |
| eu-north-1 | 0.472 |  |
| eu-south-1 | 0.426 |  |
| eu-south-2 | 0.440 |  |
| eu-west-1 | 0.327 |  |
| eu-west-2 | 0.361 |  |
| eu-west-3 | 0.384 |  |
| il-central-1 | 0.568 |  |
| me-central-1 | 0.802 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.227 |  |
| sa-east-1 | 0.516 |  |
| us-east-1 | 0.069 | 4900 |
| us-east-2 | 0.104 | 1660 |
| us-gov-east-1 | 0.103 | 1775 |
| us-gov-west-1 | 0.292 | 206 |
| us-west-1 | 0.245 | 3818 |
| us-west-2 | 0.291 | 167 |

