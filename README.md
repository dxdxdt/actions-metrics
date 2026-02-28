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
Updated: 2026-02-28T22:16:31.449615+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.018 |  |
| ap-east-1 | 0.692 |  |
| ap-east-2 | 0.631 |  |
| ap-northeast-1 | 0.514 |  |
| ap-northeast-2 | 0.616 |  |
| ap-northeast-3 | 0.535 |  |
| ap-south-1 | 0.891 |  |
| ap-south-2 | 0.893 |  |
| ap-southeast-1 | 0.762 |  |
| ap-southeast-2 | 0.654 |  |
| ap-southeast-3 | 0.820 |  |
| ap-southeast-4 | 0.694 |  |
| ap-southeast-5 | 0.782 |  |
| ap-southeast-6 | 0.728 |  |
| ap-southeast-7 | 0.865 |  |
| ca-central-1 | 0.204 | 16 |
| ca-west-1 | 0.188 |  |
| eu-central-1 | 0.525 |  |
| eu-central-2 | 0.549 |  |
| eu-north-1 | 0.583 |  |
| eu-south-1 | 0.560 |  |
| eu-south-2 | 0.557 |  |
| eu-west-1 | 0.449 |  |
| eu-west-2 | 0.480 |  |
| eu-west-3 | 0.507 |  |
| il-central-1 | 0.695 |  |
| me-central-1 | 0.899 |  |
| me-south-1 | 0.851 |  |
| mx-central-1 | 0.240 |  |
| sa-east-1 | 0.625 |  |
| us-east-1 | 0.188 | 4201 |
| us-east-2 | 0.160 | 1385 |
| us-gov-east-1 | 0.162 | 1519 |
| us-gov-west-1 | 0.167 | 166 |
| us-west-1 | 0.143 | 3143 |
| us-west-2 | 0.174 | 134 |

