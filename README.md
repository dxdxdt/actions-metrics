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
Updated: 2026-02-16T16:35:13.563652+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.891 |  |
| ap-east-1 | 0.811 |  |
| ap-east-2 | 0.766 |  |
| ap-northeast-1 | 0.645 |  |
| ap-northeast-2 | 0.762 |  |
| ap-south-1 | 0.852 |  |
| ap-south-2 | 0.919 |  |
| ap-southeast-1 | 0.909 |  |
| ap-southeast-2 | 0.797 |  |
| ap-southeast-3 | 0.963 |  |
| ap-southeast-4 | 0.844 |  |
| ap-southeast-5 | 0.914 |  |
| ap-southeast-6 | 0.857 |  |
| ap-southeast-7 | 1.004 |  |
| ca-central-1 | 0.105 | 16 |
| ca-west-1 | 0.272 |  |
| eu-central-1 | 0.396 |  |
| eu-central-2 | 0.413 |  |
| eu-north-1 | 0.440 |  |
| eu-south-1 | 0.418 |  |
| eu-south-2 | 0.432 |  |
| eu-west-1 | 0.315 |  |
| eu-west-2 | 0.351 |  |
| eu-west-3 | 0.377 |  |
| il-central-1 | 0.564 |  |
| me-central-1 | 0.776 |  |
| me-south-1 | 0.748 |  |
| mx-central-1 | 0.242 |  |
| sa-east-1 | 0.495 |  |
| us-east-1 | 0.058 | 4131 |
| us-east-2 | 0.090 | 1348 |
| us-gov-east-1 | 0.088 | 1479 |
| us-gov-west-1 | 0.306 | 149 |
| us-west-1 | 0.289 | 3065 |
| us-west-2 | 0.321 | 126 |

