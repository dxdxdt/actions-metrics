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
Updated: 2026-07-29T11:16:02.866530+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.934 |  |
| ap-east-1 | 0.750 |  |
| ap-east-2 | 0.693 |  |
| ap-northeast-1 | 0.571 |  |
| ap-northeast-2 | 0.678 |  |
| ap-northeast-3 | 0.597 |  |
| ap-south-1 | 0.865 |  |
| ap-south-2 | 0.923 |  |
| ap-southeast-1 | 0.822 |  |
| ap-southeast-2 | 0.726 |  |
| ap-southeast-3 | 0.875 |  |
| ap-southeast-4 | 0.764 |  |
| ap-southeast-5 | 0.841 |  |
| ap-southeast-6 | 0.784 |  |
| ap-southeast-7 | 0.928 |  |
| ca-central-1 | 0.189 | 17 |
| ca-west-1 | 0.235 |  |
| eu-central-1 | 0.450 |  |
| eu-central-2 | 0.468 |  |
| eu-north-1 | 0.510 |  |
| eu-south-1 | 0.472 |  |
| eu-south-2 | 0.486 |  |
| eu-west-1 | 0.372 |  |
| eu-west-2 | 0.407 |  |
| eu-west-3 | 0.434 |  |
| il-central-1 | 0.607 |  |
| me-central-1 | 0.851 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.245 |  |
| sa-east-1 | 0.560 |  |
| us-east-1 | 0.122 | 4919 |
| us-east-2 | 0.144 | 1670 |
| us-gov-east-1 | 0.145 | 1782 |
| us-gov-west-1 | 0.238 | 207 |
| us-west-1 | 0.185 | 3853 |
| us-west-2 | 0.241 | 171 |

