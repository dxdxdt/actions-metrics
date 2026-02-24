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
Updated: 2026-02-24T05:55:10.723994+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.013 |  |
| ap-east-1 | 0.677 |  |
| ap-east-2 | 0.616 |  |
| ap-northeast-1 | 0.495 |  |
| ap-northeast-2 | 0.605 |  |
| ap-northeast-3 | 0.524 |  |
| ap-south-1 | 0.956 |  |
| ap-south-2 | 0.951 |  |
| ap-southeast-1 | 0.749 |  |
| ap-southeast-2 | 0.657 |  |
| ap-southeast-3 | 0.803 |  |
| ap-southeast-4 | 0.695 |  |
| ap-southeast-5 | 0.770 |  |
| ap-southeast-6 | 0.719 |  |
| ap-southeast-7 | 0.855 |  |
| ca-central-1 | 0.229 | 16 |
| ca-west-1 | 0.210 |  |
| eu-central-1 | 0.534 |  |
| eu-central-2 | 0.564 |  |
| eu-north-1 | 0.577 |  |
| eu-south-1 | 0.560 |  |
| eu-south-2 | 0.571 |  |
| eu-west-1 | 0.444 |  |
| eu-west-2 | 0.483 |  |
| eu-west-3 | 0.510 |  |
| il-central-1 | 0.753 |  |
| me-central-1 | 0.904 |  |
| me-south-1 | 0.872 |  |
| mx-central-1 | 0.206 |  |
| sa-east-1 | 0.645 |  |
| us-east-1 | 0.179 | 4173 |
| us-east-2 | 0.155 | 1374 |
| us-gov-east-1 | 0.155 | 1503 |
| us-gov-west-1 | 0.150 | 161 |
| us-west-1 | 0.150 | 3109 |
| us-west-2 | 0.153 | 130 |

