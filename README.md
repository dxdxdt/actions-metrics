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
Updated: 2026-06-16T12:47:08.695969+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.903 |  |
| ap-east-1 | 0.771 |  |
| ap-east-2 | 0.708 |  |
| ap-northeast-1 | 0.589 |  |
| ap-northeast-2 | 0.701 |  |
| ap-northeast-3 | 0.617 |  |
| ap-south-1 | 0.863 |  |
| ap-south-2 | 0.915 |  |
| ap-southeast-1 | 0.843 |  |
| ap-southeast-2 | 0.745 |  |
| ap-southeast-3 | 0.898 |  |
| ap-southeast-4 | 0.789 |  |
| ap-southeast-5 | 0.862 |  |
| ap-southeast-6 | 0.789 |  |
| ap-southeast-7 | 0.948 |  |
| ca-central-1 | 0.157 | 16 |
| ca-west-1 | 0.266 |  |
| eu-central-1 | 0.426 |  |
| eu-central-2 | 0.454 |  |
| eu-north-1 | 0.471 |  |
| eu-south-1 | 0.462 |  |
| eu-south-2 | 0.459 |  |
| eu-west-1 | 0.343 |  |
| eu-west-2 | 0.381 |  |
| eu-west-3 | 0.405 |  |
| il-central-1 | 0.586 |  |
| me-central-1 | 0.827 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.230 |  |
| sa-east-1 | 0.543 |  |
| us-east-1 | 0.103 | 4762 |
| us-east-2 | 0.119 | 1634 |
| us-gov-east-1 | 0.124 | 1713 |
| us-gov-west-1 | 0.271 | 198 |
| us-west-1 | 0.220 | 3671 |
| us-west-2 | 0.277 | 163 |

