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
Updated: 2026-02-26T11:35:00.688058+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.010 |  |
| ap-east-1 | 0.703 |  |
| ap-east-2 | 0.635 |  |
| ap-northeast-1 | 0.524 |  |
| ap-northeast-2 | 0.639 |  |
| ap-northeast-3 | 0.553 |  |
| ap-south-1 | 0.893 |  |
| ap-south-2 | 0.917 |  |
| ap-southeast-1 | 0.770 |  |
| ap-southeast-2 | 0.666 |  |
| ap-southeast-3 | 0.837 |  |
| ap-southeast-4 | 0.711 |  |
| ap-southeast-5 | 0.801 |  |
| ap-southeast-6 | 0.746 |  |
| ap-southeast-7 | 0.877 |  |
| ca-central-1 | 0.231 | 16 |
| ca-west-1 | 0.213 |  |
| eu-central-1 | 0.533 |  |
| eu-central-2 | 0.552 |  |
| eu-north-1 | 0.552 |  |
| eu-south-1 | 0.536 |  |
| eu-south-2 | 0.553 |  |
| eu-west-1 | 0.442 |  |
| eu-west-2 | 0.465 |  |
| eu-west-3 | 0.507 |  |
| il-central-1 | 0.686 |  |
| me-central-1 | 0.895 |  |
| me-south-1 | 0.861 |  |
| mx-central-1 | 0.245 |  |
| sa-east-1 | 0.621 |  |
| us-east-1 | 0.179 | 4186 |
| us-east-2 | 0.170 | 1380 |
| us-gov-east-1 | 0.167 | 1512 |
| us-gov-west-1 | 0.189 | 162 |
| us-west-1 | 0.144 | 3123 |
| us-west-2 | 0.190 | 132 |

