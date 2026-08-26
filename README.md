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
Updated: 2026-08-26T08:33:52.798961+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.992 |  |
| ap-east-1 | 0.668 |  |
| ap-east-2 | 0.608 |  |
| ap-northeast-1 | 0.487 |  |
| ap-northeast-2 | 0.599 |  |
| ap-northeast-3 | 0.513 |  |
| ap-south-1 | 0.903 |  |
| ap-south-2 | 0.891 |  |
| ap-southeast-1 | 0.748 |  |
| ap-southeast-2 | 0.641 |  |
| ap-southeast-3 | 0.805 |  |
| ap-southeast-4 | 0.696 |  |
| ap-southeast-5 | 0.772 |  |
| ap-southeast-6 | 0.676 |  |
| ap-southeast-7 | 0.855 |  |
| ca-central-1 | 0.272 | 18 |
| ca-west-1 | 0.220 |  |
| eu-central-1 | 0.514 |  |
| eu-central-2 | 0.548 |  |
| eu-north-1 | 0.574 |  |
| eu-south-1 | 0.552 |  |
| eu-south-2 | 0.547 |  |
| eu-west-1 | 0.440 |  |
| eu-west-2 | 0.485 |  |
| eu-west-3 | 0.496 |  |
| il-central-1 | 0.686 |  |
| me-central-1 | 0.906 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.201 |  |
| sa-east-1 | 0.630 |  |
| us-east-1 | 0.187 | 5069 |
| us-east-2 | 0.214 | 1684 |
| us-gov-east-1 | 0.248 | 1885 |
| us-gov-west-1 | 0.184 | 228 |
| us-west-1 | 0.119 | 4058 |
| us-west-2 | 0.184 | 188 |

