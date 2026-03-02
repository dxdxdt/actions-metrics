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
Updated: 2026-03-02T21:26:16.414046+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.975 |  |
| ap-east-1 | 0.724 |  |
| ap-east-2 | 0.665 |  |
| ap-northeast-1 | 0.546 |  |
| ap-northeast-2 | 0.647 |  |
| ap-northeast-3 | 0.569 |  |
| ap-south-1 | 0.908 |  |
| ap-south-2 | 0.950 |  |
| ap-southeast-1 | 0.796 |  |
| ap-southeast-2 | 0.706 |  |
| ap-southeast-3 | 0.850 |  |
| ap-southeast-4 | 0.750 |  |
| ap-southeast-5 | 0.815 |  |
| ap-southeast-6 | 0.754 |  |
| ap-southeast-7 | 0.897 |  |
| ca-central-1 | 0.153 | 16 |
| ca-west-1 | 0.204 |  |
| eu-central-1 | 0.478 |  |
| eu-central-2 | 0.499 |  |
| eu-north-1 | 0.530 |  |
| eu-south-1 | 0.513 |  |
| eu-south-2 | 0.524 |  |
| eu-west-1 | 0.416 |  |
| eu-west-2 | 0.441 |  |
| eu-west-3 | 0.464 |  |
| il-central-1 | 0.652 |  |
| me-central-1 | 0.853 |  |
| me-south-1 | 0.811 |  |
| mx-central-1 | 0.219 |  |
| sa-east-1 | 0.586 |  |
| us-east-1 | 0.128 | 4210 |
| us-east-2 | 0.124 | 1391 |
| us-gov-east-1 | 0.105 | 1523 |
| us-gov-west-1 | 0.204 | 168 |
| us-west-1 | 0.206 | 3161 |
| us-west-2 | 0.198 | 136 |

