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
Updated: 2026-02-19T10:36:13.865807+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.923 |  |
| ap-east-1 | 0.750 |  |
| ap-east-2 | 0.683 |  |
| ap-northeast-1 | 0.571 |  |
| ap-northeast-2 | 0.684 |  |
| ap-northeast-3 | 0.593 |  |
| ap-south-1 | 0.907 |  |
| ap-south-2 | 0.958 |  |
| ap-southeast-1 | 0.826 |  |
| ap-southeast-2 | 0.730 |  |
| ap-southeast-3 | 0.883 |  |
| ap-southeast-4 | 0.777 |  |
| ap-southeast-5 | 0.845 |  |
| ap-southeast-6 | 0.786 |  |
| ap-southeast-7 | 0.929 |  |
| ca-central-1 | 0.134 | 16 |
| ca-west-1 | 0.235 |  |
| eu-central-1 | 0.444 |  |
| eu-central-2 | 0.464 |  |
| eu-north-1 | 0.502 |  |
| eu-south-1 | 0.475 |  |
| eu-south-2 | 0.486 |  |
| eu-west-1 | 0.370 |  |
| eu-west-2 | 0.401 |  |
| eu-west-3 | 0.416 |  |
| il-central-1 | 0.625 |  |
| me-central-1 | 0.839 |  |
| me-south-1 | 0.803 |  |
| mx-central-1 | 0.207 |  |
| sa-east-1 | 0.555 |  |
| us-east-1 | 0.120 | 4142 |
| us-east-2 | 0.107 | 1356 |
| us-gov-east-1 | 0.107 | 1492 |
| us-gov-west-1 | 0.241 | 156 |
| us-west-1 | 0.215 | 3079 |
| us-west-2 | 0.233 | 128 |

